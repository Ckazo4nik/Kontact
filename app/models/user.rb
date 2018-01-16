class User < ApplicationRecord
  has_many :restaurants
  has_many :orders
  mount_base64_uploader :image, ImageUploader

  before_create -> {self.token = generate_token}
  def self.from_omniauth(oauth_token)
    access_token = oauth_token
    facebook = Koala::Facebook::API.new(access_token)
    profile = facebook.get_object("me?fields=id,email,name,gender,birthday,location,picture.height(1024).width(1024)")
    if user = User.find_by(uid: profile["id"])
      token = user.generate_token
      picture = profile["picture"]["data"]["url"]
      user.update(token:token, image:picture)
      user
    else
      user = User.new
      user.provider = 'Facebook'
      user.email = profile["email"]
      user.uid = profile["id"]
      user.name = profile["name"]
      user.remote_image_url = profile["picture"]["data"]["url"]
      user.oauth_token = access_token
      user.save
      user
    end
  end

  def generate_token
    loop do
      token = SecureRandom.hex
      return token unless User.exists?({token: token})
    end
  end


  private


end
