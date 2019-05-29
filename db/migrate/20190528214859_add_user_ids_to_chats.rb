class AddUserIdsToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :first_user, :integer
    add_column :chats, :second_user, :integer
  end
end
