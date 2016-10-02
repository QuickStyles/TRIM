class Service < ApplicationRecord
  belongs_to :provider
  has_many :reviews, through: :bookings
end
