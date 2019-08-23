class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    @@set_time_thread = Thread.new { @user.set_time_until_deletion } #makes the countdown until logout run concurrently
    render json: @user
  end

  def index
    @users = User.all
    render json: @users
  end

  def destroy
    @user = User.find(params[:id])
    chats = @user.chats
    chats.each do |chat|
      message = Message.create(chat_id: chat.id, user_id: @user.name, chat_unique_string: chat.unique_string, text: 'chat closed')
      MessageChannel.broadcast_to(chat, message)
    end
    Chat.where('`chats`.`first_user` IN (?) OR `chats`.`second_user` IN (?)', @user.name, @user.name).delete_all
    Message.left_outer_joins(:chat).where(chats: {id: nil}).delete_all
    @user.destroy
    @users = User.all
    render json: @users
  end

  def postpone_delete
    @@set_time_thread.exit #kills the thread that was set in the create function
    @user = User.find(params[:id])
    @@set_time_thread = Thread.new { @user.set_time_until_deletion }
    render json: {ok: 'postpone successful'}
  end

  private

  def user_params
     params.require(:user).permit(:name)
  end
end
