class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_status_id, :total, :subtotal, :restaurant_id, :user_id, :user

  has_many :order_items

  def user
    user = User.find(object.user_id)

    {
        name: user.name,
        image: user.image,

    }
  end
end
