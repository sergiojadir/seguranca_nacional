class SuspiciousPassenger < ApplicationRecord
	# Associations
  belongs_to :passenger
  belongs_to :ticket

  # Callbacks
  after_commit :set_suspicious

  # Instance methods
  private
  def set_suspicious
  	tickets = Ticket.joins(:ticket).where(passenger_id: self.passenger_id)
  	count = tickets.where("DATE(tickets.date) BETWEEN '#{30.day.ago.to_date}' AND '#{Date.today}' ").count
  	self.passenger.update(suspicious: true) if count > 3
  end
end
