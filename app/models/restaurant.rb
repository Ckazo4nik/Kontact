class Restaurant < ApplicationRecord
  # model association
  has_many :dishes, dependent: :destroy
  belongs_to :user
  has_many :orders
  after_commit :populate_to_sphinx

# ...

  def populate_to_sphinx

    ThinkingSphinx::RealTime::Callbacks::RealTimeCallbacks.new(
        :restaurant
    ).after_save self
  end
  mount_base64_uploader :image, ImageUploader
  # validations
  validates_presence_of :name, :description
  validates :name, :description , presence: true

  private

  def set_user_id
    @restaurant.user_id = @user.id
  end
end
