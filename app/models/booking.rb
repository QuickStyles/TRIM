class Booking < ApplicationRecord
  belongs_to :person
  belongs_to :service
end
