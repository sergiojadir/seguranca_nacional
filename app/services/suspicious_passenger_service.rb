class SuspiciousPassengerService
	def initialize(ticket)
		@ticket = ticket
	end

	def set_suspcious!
		SuspiciousPassenger.create!(passenger_id: @ticket.passenger.id, ticket_id: @ticket.id) if is_suspicious?
	end

	def is_suspicious?
		Ticket.joins(:flight).where(
			passenger_id: @ticket.passenger.id, date: @ticket.date, flights: { destination_id: @ticket.flight.origin_id}
		).present?
	end
end