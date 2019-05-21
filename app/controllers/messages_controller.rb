class MessagesController < ApplicationController

  def create
    @message = Message.create(message_params)
    render json: @message
  end

  private

  def message_params
    params.require(:message).permit(:chat_id, :user_id, :text)
  end
end
