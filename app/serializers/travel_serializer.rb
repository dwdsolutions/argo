class TravelSerializer < ActiveModel::Serializer
  attributes :id, :name, :passengers_number, :description, :total_cost, :destination, :start_date, :end_date

  has_many :travelers
end
