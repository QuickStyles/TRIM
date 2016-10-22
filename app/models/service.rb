class Service < ApplicationRecord
  belongs_to :provider
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :rate, presence: true
  validates :location, presence: true
  validates :duration, presence: true
  validates :provider_id, presence: true
end
