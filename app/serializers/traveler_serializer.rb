class TravelerSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :travel_id
end
