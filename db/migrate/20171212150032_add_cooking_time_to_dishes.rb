class AddCookingTimeToDishes < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :cooking_time, :float
  end
end
