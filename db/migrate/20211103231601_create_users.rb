class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :company
      t.boolean :capacity_provider
      t.boolean :customer
      t.string :location
      t.string :industry
      t.text :email
      t.integer :logins_count
      t.text :picture

      t.timestamps
    end
  end
end
