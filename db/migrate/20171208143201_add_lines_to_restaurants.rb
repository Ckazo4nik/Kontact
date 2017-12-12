class AddLinesToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :image, :text
    add_column :restaurants, :image, :text
  end
end
