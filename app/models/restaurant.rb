class Restaurant < ApplicationRecord
  # model association
  has_many :dishes, dependent: :destroy
  belongs_to :user
  has_many :orders

  # validations
  validates_presence_of :name, :description
  validates :name, :description , presence: true

  private

  def set_user_id
    @restaurant.user_id = @@current_user.id
  end
end
