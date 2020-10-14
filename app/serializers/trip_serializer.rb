class TripSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :is_public, :user_id
  has_one :user
end
