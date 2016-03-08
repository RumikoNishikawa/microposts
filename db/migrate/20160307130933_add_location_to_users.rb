class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :stiring
  end
end
