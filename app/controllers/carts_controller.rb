class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :add_products_to_cart, :remove_products_from_cart]
  before_action :set_cart_service, only: [:show, :add_products_to_cart, :remove_products_from_cart]

  def create
    @cart = current_user.carts.create
    render json: { message: 'Cart created successfully', cart_id: @cart.id }, status: :created
  end

  def show
    @cart.apply_discounts(discount_rules)
    render json: {
      products: ActiveModelSerializers::SerializableResource.new(@cart.cart_items, each_serializer: CartItemSerializer),
      message: 'Total price.',
      total_price: @cart.cart_items.sum(&:price).round(2)
    }, status: :ok
  end
  

  def add_products_to_cart
    @cart_service.process_products_in_cart(products_params, :add)
    render json: { message: 'Products added to cart successfully.' }, status: :ok
  end

  def remove_products_from_cart
    @cart_service.process_products_in_cart(products_params, :remove)
    render json: { message: 'Products removed from cart successfully.' }, status: :ok
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def set_cart_service
    @cart_service = CartService.new(@cart)
  end

  def discount_rules
    [
      BuyOneGetOneFreeRule.new('GR1'),
      BulkPurchaseDiscountRule.new('SR1', 3, 0.9),
      BulkPurchaseDiscountRule.new('CF1', 3, 2.0 / 3.0)
    ]
  end

  def products_params
    params.require(:products).map do |product|
      product.permit(:product_code, :quantity)
    end
  end
end
