class AddIndexToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :unique_string, :string
    add_index :chats, :unique_string
  end
end
