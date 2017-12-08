require 'rails_helper'

RSpec.describe Dish, type: :model do
  it { should belong_to(:restaurant) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:description) }
end
