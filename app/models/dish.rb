class Dish < ApplicationRecord
  mount_base64_uploader :image, ImageRestaurantUploader
  belongs_to :restaurant
  has_many :order_items,foreign_key: 'dish_id', dependent: :destroy
  validates_presence_of :name, :price, :description, :cooking_time
  after_save :populate_to_sphinx

# ...

  def populate_to_sphinx

    ThinkingSphinx::RealTime::Callbacks::RealTimeCallbacks.new(
        :dish
    ).after_save self
  end
end
