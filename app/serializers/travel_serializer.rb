class TravelSerializer < ActiveModel::Serializer
  attributes :id, :name, :passengers_number, :description, :total_cost, :destination

  has_many :travelers
end
