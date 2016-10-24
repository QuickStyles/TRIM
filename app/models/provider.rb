class Provider < ApplicationRecord
  has_many :organizations

  has_one :user, as: :person, dependent: :destroy
  accepts_nested_attributes_for :user

  has_many :services, dependent: :destroy
  has_many :services_booked, through: :bookings, source: :booking

end
