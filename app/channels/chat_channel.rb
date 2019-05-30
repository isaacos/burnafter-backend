class ChatChannel < ApplicationCable::Channel
  def subscribed
    #creates Channel to send to the recipient of the chat to alert when a new Chat has been created
     stream_for User.find_by(id: params[:user_id])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
