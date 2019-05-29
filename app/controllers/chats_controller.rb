class ChatsController < ApplicationController
  def create
    chat = Chat.create(chat_params)
    Message.create(chat_id: chat.id, user_id: chat.first_user, text: 'has entered the chat')
    Message.create(chat_id: chat.id, user_id: chat.second_user, text: 'has entered the chat')
    serialized_data = ActiveModelSerializers::Adapter::Json.new(ChatSerializer.new(chat)).serializable_hash
    ActionCable.server.broadcast("chat_channel", serialized_data)
    #render json: serialized_data
  end

  private

  def chat_params
    params.require(:chat).permit(:first_user, :second_user)
  end


end
