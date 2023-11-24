class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    render json: { products: Product.all }, status: :ok
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { message: 'Product created successfully.' }, status: :created
    else
      render json: { error: "There is a issue while creating a product: #{@product.errors.full_messages}" }, status: :unprocessable_entity
    end
  end

  def show
    render json: @product, status: :ok
  end

  def update
    if @product.update(product_params)
      render json: { message: 'Product updated successfully.' }, status: :ok
    else
      render json: { error: "There is a issue while updating a product: #{@product.errors.full_messages}" }, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    render json: { message: 'Product deleted successfully.' }, status: :ok
  end

  private

  def product_params
    params.require(:product).permit(:code, :name, :price, :quantity)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end
end
