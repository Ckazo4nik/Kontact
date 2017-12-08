require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { should have_many(:dishes).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
