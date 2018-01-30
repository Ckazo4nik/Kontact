class AddUsersToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :users, :integer
  end
end
