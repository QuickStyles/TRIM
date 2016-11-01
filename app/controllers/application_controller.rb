class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def sign_in(user)
    session[:user_id] = user.id
  end
  helper_method :sign_in
  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find session[:user_id] if user_signed_in?
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to new_session_path unless user_signed_in?
  end

  def user_is_provider?
    user_signed_in? && current_user.person_type == 'Provider'
  end
  helper_method :user_is_provider?

  def user_is_customer?
    user_signed_in? && current_user.person_type == 'Customer'
  end
  helper_method :user_is_customer?

  def provider
    @provider ||= Provider.find(current_user.person) if user_signed_in?
  end
  helper_method :provider

  def current_year
    Time.current.year
  end

  def previous_year
    Time.current.last_year.year
  end

  def past_bookings(service)
    # @past_bookings = service.bookings.where('time_end < ?', Time.now).count
    Booking.all.where(service_id: service).where('time_end < ?', Time.now).count
  end
  helper_method :past_bookings

  def future_bookings(service)
    Booking.all.where(service_id: service).where('time_end > ?', Time.now).count
  end
  helper_method :future_bookings

  def current_bookings(service)
    Booking.all.where(service_id: service).where(time_end: Time.now.beginning_of_day..Time.now.end_of_day).count
  end
  helper_method :current_bookings

  def future_bookings(service)
    Booking.all.where(service_id: service).where('time_end > ?', Time.now)
  end
  helper_method :future_bookings

  def chart_data(previous_year_data, current_year_data)
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
          data: previous_year_data
        },
        {
          label: 'Current Year',
          backgroundColor: 'rgba(151,187,205,0.2)',
          borderColor: 'rgba(151,187,205,1)',
          data: current_year_data
        }
      ]
    }
  end
  helper_method :chart_data
  def chart_options
    {
      width: '200px',
      height: '75px'
    }
  end
  helper_method :chart_options
end
