class AddAskingPriceToOfferings < ActiveRecord::Migration[6.1]
  def change
    add_column :offerings, :asking_price, :float, scale: 2
  end
end
