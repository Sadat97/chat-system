class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.belongs_to :chat, foreign_key: true

      t.timestamps
    end
  end
end
