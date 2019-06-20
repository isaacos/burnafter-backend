class AddChatUniqueStringToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :chat_unique_string, :string
    add_foreign_key :messages, :chats, column: :chat_unique_string
  end
end
