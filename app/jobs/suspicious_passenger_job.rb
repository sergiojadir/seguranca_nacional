class SuspiciousPassengerJob < ApplicationJob
  queue_as :default

  def perform(ticket_id)
  	ticket = Ticket.find(ticket_id)
    suspicious_passenger = SuspiciousPassengerService.new(ticket)
    suspicious_passenger.set_suspcious!
  end
end
