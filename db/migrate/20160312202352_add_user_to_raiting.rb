class AddUserToRaiting < ActiveRecord::Migration
  def change
    add_reference :raitings, :user, index: true, foreign_key: true
  end
end
