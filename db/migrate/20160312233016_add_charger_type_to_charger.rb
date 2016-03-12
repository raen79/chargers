class AddChargerTypeToCharger < ActiveRecord::Migration
  def change
    add_column :chargers, :charger_type, :string
  end
end
