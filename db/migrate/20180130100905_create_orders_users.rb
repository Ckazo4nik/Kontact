class CreateOrdersUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :orders_users do |t|
      t.belongs_to :order
      t.belongs_to :user
      t.timestamps
    end
  end
end
