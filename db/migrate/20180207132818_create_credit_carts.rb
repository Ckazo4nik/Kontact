class CreateCreditCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_carts do |t|
      t.string :cart_number
      t.string :cart_date
      t.belongs_to :user

      t.timestamps
    end
  end
end
