class Restaurant < ApplicationRecord
  # model association
  has_many :dishes, dependent: :destroy

  # validations
  validates_presence_of :name, :description
  validates :name, :description , presence: true
end
