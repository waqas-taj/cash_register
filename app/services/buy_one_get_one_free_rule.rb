class BuyOneGetOneFreeRule
  def initialize(product_code)
    @product_code = product_code
  end

  def apply(cart)
    product = Product.find_by(code: @product_code)
    return unless product

    cart.cart_items.where(product_id: product.id).each_slice(2) do |group|
      group.last.update(price: 0) if group.size == 2
    end
  end
end
