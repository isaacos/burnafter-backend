class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_for Chat.find_by(unique_string: params[:unique_string])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    chat = Chat.find_by(id: params[:chat_id])
    chat.unsubscribe()
  end
end
