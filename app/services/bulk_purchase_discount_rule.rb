class BulkPurchaseDiscountRule
  def initialize(product_code, min_quantity, discount_factor)
    @product_code = product_code
    @min_quantity = min_quantity
    @discount_factor = discount_factor
  end

  def apply(cart)
    product = Product.find_by(code: @product_code)
    return unless product

    items = cart.cart_items.where(product_id: product.id)
    items.each { |item| item.update(price: product.price * @discount_factor) } if items.size >= @min_quantity
  end
end
