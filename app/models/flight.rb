class Flight < ApplicationRecord
	# Associations
	belongs_to :origin, class_name: 'Aeroporto', foreign_key: 'origin_id'
	belongs_to :destination, class_name: 'Aeroporto', foreign_key: 'destination_id'

  has_many :tickets
  has_many :passengers, through: :tickets

  def origin_name
  	origin.nome
  end

  def destination_name
  	origin.nome
  end

  def departure_time_to_s
  	departure_time.strftime("%d/%m/%Y")
  end

  def arrival_time_to_s
  	arrival_time.strftime("%d/%m/%Y")
  end
end
