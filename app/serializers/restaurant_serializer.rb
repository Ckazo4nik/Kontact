class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image, :user_id, :secret_key_restaurant, :public_key_restaurant
  has_many :dishes
end
