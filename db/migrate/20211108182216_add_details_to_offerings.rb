class AddDetailsToOfferings < ActiveRecord::Migration[6.1]
  def change
    add_column :offerings, :origin_date, :datetime
    add_column :offerings, :destination_date, :datetime
  end
end
