class Dish < ApplicationRecord
  include RubySimpleSearch
  mount_base64_uploader :image, ImageUploader
  belongs_to :restaurant
  has_many :order_items,foreign_key: 'dish_id', dependent: :destroy
  validates_presence_of :name, :price, :description, :cooking_time
  after_commit :populate_to_sphinx
  simple_search_attributes :name
# ...

  def populate_to_sphinx

    ThinkingSphinx::RealTime::Callbacks::RealTimeCallbacks.new(
        :dish
    ).after_save self
  end
end
