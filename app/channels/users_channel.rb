class UsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "users_channel"
  end

  def unsubscribed
    stop_all_streams
  end
end
