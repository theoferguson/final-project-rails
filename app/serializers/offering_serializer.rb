class OfferingSerializer < ActiveModel::Serializer
  attributes :id, :name, :less_than_truckload, :full_truckload, :origin, :origin_date, :destination, :destination_date, :user, :asking_price
  has_one :user
  
end
