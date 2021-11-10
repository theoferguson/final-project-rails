class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :capacity_provider, :boolean, :default => false
  end
end
