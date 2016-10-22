class ServiceStatisticsController < ApplicationController
  def index
    @services = provider.services
  end

  def show
    @service = Service.find params[:id]
    @income_chart_data = income_chart_data
    @income_chart_options = income_chart_options
    @booking_chart_data = booking_chart_data
    @booking_chart_options = booking_chart_options
  end

  private

  def previous_year_bookings
    previous_year_bookings = @service.bookings.where(time_end: Time.now.beginning_of_year-1.year..Time.now.end_of_year-1.year)
  end

  def current_year_bookings
    current_year_bookings = @service.bookings.where(time_end: Time.now.beginning_of_year..Time.now.end_of_year)
  end

  def income_chart_data
    {
      labels: %w(January
                 February
                 March
                 April
                 May
                 June
                 July
                 August
                 September
                 October
                 November
                 December),
      datasets: [
        {
          label: 'Previous Year',
          backgroundColor: 'rgba(220,220,220,0.2)',
          borderColor: 'rgba(220,220,220,1)',
          data: previous_year_income_data
        },
        {
          label: 'Current_Year',
          backgroundColor: 'rgba(151,187,205,0.2)',
          borderColor: 'rgba(151,187,205,1)',
          data: current_year_income_data
        }
      ]
    }
  end

  def income_chart_options
    {
      width: '400px',
      height: '174px'
    }
  end

  def previous_year_income_data
    [previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(1).all_month).count * @service.rate,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(1).all_month).count * @service.rate,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(2).all_month).count * @service.rate,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(3).all_month).count * @service.rate,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(4).all_month).count * @service.rate,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(5).all_month).count * @service.rate,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(6).all_month).count * @service.rate,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(7).all_month).count * @service.rate,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(8).all_month).count * @service.rate,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(9).all_month).count * @service.rate,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(10).all_month).count * @service.rate,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(11).all_month).count * @service.rate]
  end

  def current_year_income_data
    [current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(0).all_month).count * @service.rate,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(1).all_month).count * @service.rate,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(2).all_month).count * @service.rate,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(3).all_month).count * @service.rate,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(4).all_month).count * @service.rate,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(5).all_month).count * @service.rate,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(6).all_month).count * @service.rate,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(7).all_month).count * @service.rate,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(8).all_month).count * @service.rate,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(9).all_month).count * @service.rate,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(10).all_month).count * @service.rate,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(11).all_month).count * @service.rate]
  end

  def previous_year_bookings_data
    [previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(0).all_month).count,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(1).all_month).count,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(2).all_month).count,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(3).all_month).count,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(4).all_month).count,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(5).all_month).count,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(6).all_month).count,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(7).all_month).count,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(8).all_month).count,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(9).all_month).count,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(10).all_month).count,
     previous_year_bookings.where(time_end: Time.now.prev_year.beginning_of_year.months_since(11).all_month).count]
  end

  def current_year_bookings_data
    [current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(0).all_month).count,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(1).all_month).count,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(2).all_month).count,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(3).all_month).count,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(4).all_month).count,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(5).all_month).count,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(6).all_month).count,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(7).all_month).count,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(8).all_month).count,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(9).all_month).count,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(10).all_month).count,
     current_year_bookings.where(time_end: Time.now.beginning_of_year.months_since(11).all_month).count]
  end

  def booking_chart_data
    {
      labels: %w(January
                 February
                 March
                 April
                 May
                 June
                 July
                 August
                 September
                 October
                 November
                 December),
      datasets: [
        {
          label: 'Previous Year',
          backgroundColor: 'rgba(220,220,220,0.2)',
          borderColor: 'rgba(220,220,220,1)',
          data: previous_year_bookings_data
        },
        {
          label: 'Current_Year',
          backgroundColor: 'rgba(151,187,205,0.2)',
          borderColor: 'rgba(151,187,205,1)',
          data: current_year_bookings_data
        }
      ]
    }
  end

  def booking_chart_options
    {
      width: '400px',
      height: '174px'
    }
  end
end
