class MessagesController < ApplicationController

  def create

    message = Message.create(message_params)
    associated_chat = Chat.find_by(id: message.chat_id)
    MessageChannel.broadcast_to(associated_chat, message)
    #render json: @message
  end

  private

  def message_params
    params.require(:message).permit(:chat_id, :user_id, :text)
  end
end
