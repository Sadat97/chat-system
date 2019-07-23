class ChangeChatAndMessageCountDefaultToZero < ActiveRecord::Migration[5.2]
  def change
    change_column :applications, :chats_count, :integer ,default: 0, null: false
    change_column :chats, :messages_count, :integer ,default: 0, null: false
  end
end
