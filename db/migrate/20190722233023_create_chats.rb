class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.belongs_to :application, foreign_key: true

      t.timestamps
    end
  end
end
