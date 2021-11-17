class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :message
      t.belongs_to :user, foreign_key: true
      t.belongs_to :post, foreign_key: true, on_delete: :cascade
      t.references :sender, null: false

      t.timestamps
    end
    add_foreign_key :messages, :users, column: :sender_id
  end
end
