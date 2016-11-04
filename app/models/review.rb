class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :customer

  validates :rating, presence: true
  validates :booking_id, presence: true
  validates :customer_id, presence: true
end
