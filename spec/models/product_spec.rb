require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:cart_items) }
  
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:name) }
  
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

  it { should validate_presence_of(:quantity) }
  it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
end
