class AddUserToCharger < ActiveRecord::Migration
  def change
    add_reference :chargers, :user, index: true, foreign_key: true
  end
end
