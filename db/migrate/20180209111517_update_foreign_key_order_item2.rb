class UpdateForeignKeyOrderItem2 < ActiveRecord::Migration[5.1]
  def change
    # remove the old foreign_key
    remove_foreign_key :order_items, :dishes

    # add the new foreign_key
    add_foreign_key :order_items, :dishes, on_delete: :cascade
  end
end
