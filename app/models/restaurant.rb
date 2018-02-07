class Restaurant < ApplicationRecord

  include RubySimpleSearch
  # model association
  has_many :dishes, dependent: :destroy
  belongs_to :user
  has_many :orders
  simple_search_attributes :name

  mount_base64_uploader :image, ImageUploader
  # validations

  private

  def set_user_id
    @restaurant.user_id = @user.id
  end

end
