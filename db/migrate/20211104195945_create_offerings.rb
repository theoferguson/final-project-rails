class CreateOfferings < ActiveRecord::Migration[6.1]
  def change
    create_table :offerings do |t|
      t.belongs_to :user
      t.datetime :posted_at
      t.string :name
      t.boolean :less_than_truckload
      t.boolean :full_truckload
      t.string :destination
      t.string :origin

      t.timestamps
    end
  end
end
