class ChatSerializer < ActiveModel::Serializer
  attributes :id, :unique_string
  has_many :messages
  has_many :users
end
