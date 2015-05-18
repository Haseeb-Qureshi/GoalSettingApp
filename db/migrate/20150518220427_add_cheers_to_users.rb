class AddCheersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cheers, :integer, null: false, default: 5
  end
end
