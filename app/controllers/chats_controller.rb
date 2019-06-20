class ChatsController < ApplicationController
  def create
    unique_string = SecureRandom.alphanumeric(10)
    chat = Chat.create(first_user: chat_params['first_user'], second_user: chat_params['second_user'], unique_string: unique_string)
    Message.create(chat_id: chat.id, user_id: chat.first_user, chat_unique_string: chat.unique_string , text: 'has entered the chat')
    Message.create(chat_id: chat.id, user_id: chat.second_user, chat_unique_string: chat.unique_string, text: 'has entered the chat')
    serialized_data = ActiveModelSerializers::Adapter::Json.new(ChatSerializer.new(chat)).serializable_hash
    recipient = User.find_by(id: chat.second_user)
    ChatChannel.broadcast_to(recipient, serialized_data)
    render json: serialized_data
  end

  private

  def chat_params
    params.require(:chat).permit(:first_user, :second_user)
  end


end
