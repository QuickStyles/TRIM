class BookingsController < ApplicationController
  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.find params[:service_id]
    @booking = Booking.new
  end

  def create
    @booking = Booking.new booking_params
    @booking.service_id = params[:service_id]
    @booking.customer_id = current_user.person_id
    if @booking.save
      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = session[:google_access_token]
      event = Google::Apis::CalendarV3::Event.new({
        summary: 'event summary',
        location: '800 Howard St., San Fransisco, CA 94103',
        description: 'event description',
        start: {
          date_time: (@booking.time_start).to_time.iso8601,
          time_zone: 'America/Los_Angeles'
        },
        end: {
          date_time: (@booking.time_end).to_time.iso8601,
          time_zone: 'America/Los_Angeles'
        },
        attendees: [
          {email: current_user.email},
          {email: @booking.service.provider.user.email},
        ],
        reminders: {
          use_default: true
        }
      })
      service.insert_event(session[:main_calendar]['id'], event)
      redirect_to new_booking_payment_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:time_start, :time_end)
  end
end
