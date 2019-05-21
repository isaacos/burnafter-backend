class ChatController < ApplicationController
  def create
    @chat = Chat.create()
    render :json @chat
  end
end
