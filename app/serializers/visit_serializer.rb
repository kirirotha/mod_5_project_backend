class VisitSerializer < ActiveModel::Serializer
  attributes :id, :trip_id, :location_name, :latitude, :longitude, :date_visited, :description, :phone, :reservable, :email
  has_one :trip
end
