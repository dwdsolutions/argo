class TravelerSerializer < ActiveModel::Serializer
  attributes :id, :name, :cost_by_person

  #belongs_to :travel
end
