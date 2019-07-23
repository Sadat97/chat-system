class AddNumberFieldToChatAndMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :number, :integer
    add_column :messages, :number, :integer
    add_index :chats, :number
    add_index :messages, :number
  end
end
