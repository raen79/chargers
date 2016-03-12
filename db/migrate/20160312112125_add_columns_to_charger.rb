class AddColumnsToCharger < ActiveRecord::Migration
  def change
    add_column :chargers, :price, :integer
    add_column :chargers, :location, :string
    add_column :chargers, :phone, :string
  end
end
