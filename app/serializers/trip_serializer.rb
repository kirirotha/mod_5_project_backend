class TripSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :is_public, :user_id, :route
  has_one :user
end
