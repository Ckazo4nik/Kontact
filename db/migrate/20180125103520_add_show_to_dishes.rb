class AddShowToDishes < ActiveRecord::Migration[5.1]
  def change
    add_column :dishes, :show, :boolean, default: false
  end
end
