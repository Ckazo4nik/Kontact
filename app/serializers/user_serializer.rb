class UserSerializer < ActiveModel::Serializer
  attributes :id, :phone, :provider, :uid, :name, :oauth_token, :token, :email, :image

  def image
        object.image.url
  end
end
