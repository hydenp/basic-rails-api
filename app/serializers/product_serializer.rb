class ProductSerializer < ActiveModel::Serializer
  attributes :id, :product_name, :sku, :inventory_quantity

  belongs_to :store
end

