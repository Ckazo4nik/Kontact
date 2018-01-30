class OrderSerializer < ActiveModel::Serializer
  attributes :id, :order_status_id, :total, :subtotal, :restaurant, :user_id, :user,:order_items, :users

  has_many :order_items
has_many :users
  def user
    user = User.find(object.user_id)

    {
        name: user.name,
        image: user.image,

    }
  end

  def restaurant
    name = object.restaurant.name
    image = object.restaurant.image
    id = object.restaurant.id

    {
        id: id,
        name: name,
        image:image
    }
  end

  class UserSerializer < ActiveModel::Serializer
    has_many :orders
    attributes :id, :name,:image

    def restaurant
      object.restaurants.first.id if object.restaurants.first.present?
    end
    def image
      object.image
    end
  end

end
