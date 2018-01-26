class UpdateForeignKeyOrderItem < ActiveRecord::Migration[5.1]
  def change
    # remove the old foreign_key
    remove_foreign_key :order_items, :orders

    # add the new foreign_key
    add_foreign_key :order_items, :orders, on_delete: :cascade
  end
end
