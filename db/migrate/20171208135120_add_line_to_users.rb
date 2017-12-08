class AddLineToUsers < ActiveRecord::Migration[5.1]
  def up
    drop_table :users

    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string  :email
      t.text :image
      t.datetime :oauth_expires_at


      t.timestamps
    end
  end
end
