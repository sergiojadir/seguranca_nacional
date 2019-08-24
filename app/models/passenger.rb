class Passenger < ApplicationRecord
	has_many :tickets
	has_many :flights, through: :tickets

	validates :name, :national_id, :gender, presence: true
end
