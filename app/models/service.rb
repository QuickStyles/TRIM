class Service < ApplicationRecord
  belongs_to :provider
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :rate, presence: true
  validates :location, presence: true
  validates :duration, presence: true
  validates :provider_id, presence: true

  def self.provider_services(user)
    Service.where(provider_id: user)
  end

  def monthly_revenue(year, month)
    bookings.where(time_end: Time.mktime(year, month).all_month).count * self.rate
  end

  def monthly_booking(year, month)
    bookings.where(time_end: Time.mktime(year, month).all_month).count
  end
end
