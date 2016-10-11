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
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:time_start, :time_end)
  end
end
