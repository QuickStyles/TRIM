class Provider < ApplicationRecord
  has_many :organizations

  has_one :user, as: :person, dependent: :destroy
  accepts_nested_attributes_for :user

  has_many :services, dependent: :destroy
  has_many :bookings, through: :services
  def sid_list
    services.pluck(:id)
  end

  def previous_year_bookings
    bookings.where(time_end: Time.now.beginning_of_year-1.year..Time.now.end_of_year-1.year)
  end

  def current_year_bookings
    bookings.where(time_end: Time.now.beginning_of_year..Time.now.end_of_year)
  end

  def revenue_data(year)
    revenue_data = []
    months = %w(jan feb mar apr may jun jul aug sep oct nov dec)
    months.each do |month|
      month_revenue = []
      services.each do |service|
        month_revenue << service.monthly_revenue(year, month)
      end
      revenue_data << month_revenue.reduce(:+)
    end
    revenue_data.include?(nil) ? [0] : revenue_data
  end

  def booking_data(year)
    booking_data = []
    months = %w(jan feb mar apr may jun jul aug sep oct nov dec)
    months.each do |month|
      month_booking = []
      services.each do |service|
        month_booking << service.monthly_booking(year, month)
      end
      booking_data << month_booking.reduce(:+)
    end
    booking_data.include?(nil) ? [0] : booking_data
  end

  def annual_revenue
    revenue_data(Time.current.year).reduce(:+)
  end

  def annual_bookings
    booking_data(Time.current.year).reduce(:+)
  end
end
