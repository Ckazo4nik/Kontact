class Dish < ApplicationRecord
  mount_base64_uploader :image, ImageRestaurantUploader
  belongs_to :restaurant
  has_many :order_items,foreign_key: 'dish_id', dependent: :destroy
  validates_presence_of :name, :price, :description, :cooking_time

end
