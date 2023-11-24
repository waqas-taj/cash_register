class ProductSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :price, :quantity
end
