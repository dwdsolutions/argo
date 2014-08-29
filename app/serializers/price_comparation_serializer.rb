class PriceComparationSerializer < ActiveModel::Serializer
  attributes :id, :description, :category, :unit_cost, :source_information, :count
end
