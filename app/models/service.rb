class Service < ApplicationRecord
  belongs_to :provider
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
end
