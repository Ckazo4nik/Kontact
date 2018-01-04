class Dish < ApplicationRecord
  belongs_to :restaurant, dependent: :destroy
  has_many :order_items,foreign_key: 'dish_id', dependent: :destroy
  validates_presence_of :name, :price, :description, :cooking_time

end
