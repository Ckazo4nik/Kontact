class Restaurant < ApplicationRecord
  # model association
  has_many :dishes, dependent: :destroy
  belongs_to :user

  # validations
  validates_presence_of :name, :description
  validates :name, :description , presence: true
end
