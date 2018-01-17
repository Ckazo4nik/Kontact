class UserSerializer < ActiveModel::Serializer
  attributes :id, :phone, :provider, :uid, :name, :oauth_token, :token, :email, :image, :restaurant

  def restaurant
   object.restaurants.first.id
  end
  def image
        object.image
  end
end
