class AddChargerToRaiting < ActiveRecord::Migration
  def change
    add_reference :raitings, :charger, index: true, foreign_key: true
  end
end
