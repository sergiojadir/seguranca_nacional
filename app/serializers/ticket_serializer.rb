class TicketSerializer < ActiveModel::Serializer
  attributes :id, :passenger, :seat_number, :origin, :destination, :passenger, :flight
end
