require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:user) { create(:user) }
  let(:cart) { create(:cart, user: user) }
  let!(:green_tea) { create(:product, code: 'GR1', name: 'Green Tea', price: 3.11) }
  let!(:strawberries) { create(:product, code: 'SR1', name: 'Strawberries', price: 5.00) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    it 'creates a new cart for the current user' do
      post :create
      expect(response).to have_http_status(:created)
      expect(json_response['message']).to eq('Cart created successfully')
      expect(json_response['cart_id']).to be_present
    end
  end

  describe 'GET #show' do
    it 'shows the total price of the cart with applied discounts' do
      cart_items = [
        {product: green_tea, quantity: 2},
        {product: strawberries, quantity: 1}
      ]
      cart.cart_items.create(cart_items)

      get :show, params: { id: cart.id }

      expect(response).to have_http_status(:ok)
      expect(json_response['message']).to eq('Total price.')
      expect(json_response['total_price'].to_f).to eq(8.11)
    end
  end

  describe 'POST #add_products_to_cart' do
    it 'adds products to the cart' do
      post :add_products_to_cart, params: { id: cart.id, products: [{ product_code: 'GR1', quantity: 2 }] }

      expect(response).to have_http_status(:ok)
      expect(json_response['message']).to eq('Products added to cart successfully.')
    end
  end

  describe 'POST #remove_products_from_cart' do
    it 'removes products from the cart' do
      cart.cart_items.create(product: green_tea, quantity: 3)

      post :remove_products_from_cart, params: { id: cart.id, products: [{ product_code: 'GR1', quantity: 2 }] }

      expect(response).to have_http_status(:ok)
      expect(json_response['message']).to eq('Products removed from cart successfully.')
    end
  end

  private

  def json_response
    JSON.parse(response.body)
  end
end
