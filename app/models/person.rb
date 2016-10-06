class Person < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependant: :destroy
  has_many :booked_services, through: :bookings, source: :service
  has_many :reviews, dependant: :destroy
end
