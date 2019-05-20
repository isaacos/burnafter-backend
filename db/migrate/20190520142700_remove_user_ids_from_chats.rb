class RemoveUserIdsFromChats < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :user_1, :integer
    remove_column :chats, :user_2, :integer
    add_column :messages, :text, :text
  end
end
