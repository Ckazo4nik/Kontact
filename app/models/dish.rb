class Dish < ApplicationRecord
  belongs_to :restaurant, dependent: :destroy
  validates_presence_of :name, :price, :description

end
