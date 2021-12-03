class CreateUserData < ActiveRecord::Migration[6.1]
  def change
    create_table :user_data do |t|
      t.string :category
      t.belongs_to :user, foreign_key: true
      t.string :content

      t.timestamps
    end
  end

end
