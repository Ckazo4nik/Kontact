class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :card_number
      t.string :card_date
      t.belongs_to :user

      t.timestamps
    end
  end
end
