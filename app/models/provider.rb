class Provider < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :services, dependant: :destroy
  has_many :bookings, through: :services
end
