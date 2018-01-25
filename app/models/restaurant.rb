class Restaurant < ApplicationRecord
  # model association
  has_many :dishes, foreign_key: 'restaurant_id', dependent: :destroy
  belongs_to :user
  has_many :orders
  after_save ThinkingSphinx::RealTime.callback_for(:restaurant)
  mount_base64_uploader :image, ImageUploader
  # validations
  validates_presence_of :name, :description
  validates :name, :description , presence: true

  private

  def set_user_id
    @restaurant.user_id = @user.id
  end
end
