class Flight < ApplicationRecord
	# Associations
	belongs_to :origin, class_name: 'Aeroporto', foreign_key: 'origin_id'
	belongs_to :destination, class_name: 'Aeroporto', foreign_key: 'destination_id'

  has_many :tickets
  has_many :passengers, through: :tickets
end
