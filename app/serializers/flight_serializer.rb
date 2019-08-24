class FlightSerializer < ActiveModel::Serializer
  attributes :id, :number, :origin, :destination, :departure_time_to_s, :arrival_time_to_s
end
