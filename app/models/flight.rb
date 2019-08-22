class Flight < ApplicationRecord
  has_many :tickets
  has_many :passengers, through: :tickets
end
