class CartService
  def initialize(cart)
    @cart = cart
  end

  def process_products_in_cart(products, action)
    products.each do |item|
      product_code = item[:product_code]
      product = find_product_by_code(product_code)
      quantity = [item[:quantity].to_i, 1].max

      case action
      when :add
        add_product_to_cart(product, quantity)
      when :remove
        remove_product_from_cart(product, quantity)
      end
    end
  end

  private

  def add_product_to_cart(product, quantity)
    raise StandardError.new('Invalid product code or insufficient quantity for product') unless product && product.quantity >= quantity

    update_cart_item(product, quantity, :add)
    product.update!(quantity: product.quantity - quantity)
  end

  def remove_product_from_cart(product, quantity)
    existing_item = find_cart_item(product)
    raise StandardError.new('Product not found in cart') unless existing_item

    update_cart_item(product, quantity, :remove)
    product.update!(quantity: product.quantity + quantity)
  end

  def update_cart_item(product, quantity, operation)
    existing_item = find_cart_item(product)
    new_quantity = calculate_new_quantity(existing_item, quantity, operation)
    update_or_create_cart_item(existing_item, product, new_quantity)
  end

  def calculate_new_quantity(existing_item, quantity, operation)
    if operation == :add
      existing_item ? existing_item.quantity + quantity : quantity
    else
      [existing_item.quantity - quantity, 0].max
    end
  end

  def update_or_create_cart_item(existing_item, product, new_quantity)
    if new_quantity.zero?
      existing_item&.destroy!
    else
      existing_item ? existing_item.update!(quantity: new_quantity) : @cart.cart_items.create!(product: product, quantity: new_quantity)
    end
  end

  def find_product_by_code(product_code)
    Product.find_by(code: product_code)
  end

  def find_cart_item(product)
    @cart.cart_items.find_by(product: product)
  end
end
