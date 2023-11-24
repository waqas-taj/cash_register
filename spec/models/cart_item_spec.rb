require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe 'associations' do
    it { should belong_to(:cart) }
    it { should belong_to(:product) }
  end

  describe '#set_price' do
    let(:product) { create(:product, price: 10.0) }
    let(:cart_item) { build(:cart_item, product: product) }

    it 'sets price before create' do
      cart_item.save
      expect(cart_item.price).to eq(10.0)
    end
  end
end
