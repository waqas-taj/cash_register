# app/serializers/cart_item_serializer.rb

class CartItemSerializer < ActiveModel::Serializer
  attributes :name, :quantity, :unit_price

  def name
    @object.product.name
  end

  def unit_price
    @object.product.price
  end
end
