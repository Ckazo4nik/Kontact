class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image, :user_id
  has_many :dishes
end
