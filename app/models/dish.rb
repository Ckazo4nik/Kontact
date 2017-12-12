class Dish < ApplicationRecord
  belongs_to :restaurant, dependent: :destroy
  has_many :order_items
  validates_presence_of :name, :price, :description, :cooking_time

end
