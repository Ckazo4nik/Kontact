class UserSerializer < ActiveModel::Serializer
  attributes :id, :provider, :uid, :name, :oauth_token, :token, :email, :image

  def image
        object.image
  end
end
