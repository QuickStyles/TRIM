class Customer < ApplicationRecord
  has_one :user, as: :person, dependent: :destroy

  has_many :bookings, dependent: :destroy
  has_many :booked_services, through: :bookings, source: :service

  has_many :reviews, dependent: :destroy
end
