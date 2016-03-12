class CreateCommercialChargers < ActiveRecord::Migration
  def change
    create_table :commercial_chargers do |t|
      t.string :name
      t.text :description
      t.string :coordinates

      t.timestamps null: false
    end
  end
end
