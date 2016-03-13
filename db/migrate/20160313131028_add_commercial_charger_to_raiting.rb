class AddCommercialChargerToRaiting < ActiveRecord::Migration
  def change
    add_reference :raitings, :commercial_charger, index: true, foreign_key: true
  end
end
