class Ticket < ApplicationRecord
	# Associations
  belongs_to :passenger
  belongs_to :flight

  # Validations
  validates :date, presence: true

  # Callbacks
  after_commit :manager_suspicous_passenger, con: :create

  # Scopes
  scope :last_30_days, -> { where("DATE(created_at) BETWEEN '#{30.day.ago.to_date}' AND '#{Date.today}' ") }

  # Instance methods

  def origin
    flight.origin.nome
  end

  def destination
    flight.destination.nome
  end

  private
  def manager_suspicous_passenger
  	SuspiciousPassengerJob.perform_later(self.id)
  end
end
