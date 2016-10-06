class Provider < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  has_many :services, dependent: :destroy
  has_many :bookings, through: :services
end
