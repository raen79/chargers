class ChangeDescriptionInCommercialCharger < ActiveRecord::Migration
  def change
    change_column :commercial_chargers, :description, :string
  end
end
