class UsersController < ApplicationController

  def create
    @user = User.create(user_params)
    ActionCable.server.broadcast("users_channel", @user)
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
      message = Message.create(chat_id: chat.id, user_id: @user.id, text: 'chat closed')
      MessageChannel.broadcast_to(chat, message)

      chat.messages.each do |message|
        message.destroy
      end
      chat.destroy
    end

    @user.destroy
  end

  private

  def user_params
     params.require(:user).permit(:name)
  end
end
