require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new product' do
        expect do
          post :create, params: { product: attributes_for(:product) }
        end.to change(Product, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: { product: attributes_for(:product) }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'returns an unprocessable_entity response' do
        post :create, params: { product: attributes_for(:product, code: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      product = create(:product)
      get :show, params: { id: product.to_param }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT #update' do
    let(:product) { create(:product) }

    context 'with valid parameters' do
      it 'updates the requested product' do
        put :update, params: { id: product.to_param, product: { name: 'New Name' } }
        product.reload
        expect(product.name).to eq('New Name')
      end

      it 'returns a success response' do
        put :update, params: { id: product.to_param, product: { name: 'New Name' } }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid parameters' do
      it 'returns an unprocessable_entity response' do
        put :update, params: { id: product.to_param, product: { code: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested product' do
      product = create(:product)
      expect do
        delete :destroy, params: { id: product.to_param }
      end.to change(Product, :count).by(-1)
    end

    it 'returns a success response' do
      product = create(:product)
      delete :destroy, params: { id: product.to_param }
      expect(response).to have_http_status(:ok)
    end
  end
end
