class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :text, :chat_id, :chat_unique_string
end
