class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :image, :cooking_time, :restaurant_id
end
