class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :info
  belongs_to :dish
  def info
    item = object

    {
        dish_id: item.dish.id,
        dish_name: item.dish.name,
        unit_price: item.unit_price,
        quantity: item.quantity,
        total_price: item.total_price,
        restaurant_id: item.dish.restaurant_id,
    }
  end


end
