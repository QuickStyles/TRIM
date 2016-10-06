class Booking < ApplicationRecord
  belongs_to :person
  belongs_to :service
  has_many :reviews, dependent: :nullify
end
