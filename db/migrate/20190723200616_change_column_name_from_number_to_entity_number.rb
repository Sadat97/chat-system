class ChangeColumnNameFromNumberToEntityNumber < ActiveRecord::Migration[5.2]
  def change
    rename_column :chats, :number, :chat_number
    rename_column :messages, :number, :message_number
  end
end
