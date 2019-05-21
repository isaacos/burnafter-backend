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

  private

  def user_params
     params.require(:user).permit(:name)
  end
end
