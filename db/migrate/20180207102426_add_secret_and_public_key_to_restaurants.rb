class AddSecretAndPublicKeyToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :secret_key_restaurant, :string
    add_column :restaurants, :public_key_restaurant, :string
  end
end
