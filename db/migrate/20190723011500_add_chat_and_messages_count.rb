class AddChatAndMessagesCount < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :messages_count, :integer
    add_column :applications, :chats_count, :integer
  end
end
