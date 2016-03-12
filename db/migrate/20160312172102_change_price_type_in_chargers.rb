class ChangePriceTypeInChargers < ActiveRecord::Migration
  def change
  	change_column :chargers, :price, :float
  end
end
