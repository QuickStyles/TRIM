class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :customer
  has_many :reviews, dependent: :nullify
end
