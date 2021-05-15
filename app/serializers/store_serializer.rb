class StoreSerializer < ActiveModel::Serializer
  attributes :id, :store_name

  has_many :products
end
