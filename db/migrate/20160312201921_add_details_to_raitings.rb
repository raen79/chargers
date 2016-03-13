class AddDetailsToRaitings < ActiveRecord::Migration
  def change
    add_column :raitings, :ok, :boolean
    add_column :raitings, :review, :text
  end
end
