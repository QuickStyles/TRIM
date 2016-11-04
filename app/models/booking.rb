class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :customer
  has_many :reviews, dependent: :nullify

  validates :time_start, presence: true, uniqueness: true
  validates :time_end, presence: true, uniqueness: true
  validates :service_id, presence: true
  validates :customer_id, presence: true

  def cost
    service.rate
  end

  def provider
    service.provider
  end

  def service_name
    service.name
  end

  def provider_name
    provider.user.full_name
  end
end
