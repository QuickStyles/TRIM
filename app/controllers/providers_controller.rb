class ProvidersController < ApplicationController
  def index
    @services = Service.provider_services(provider)
    @booking = provider.bookings
    @revenue_data = chart_data(provider.revenue_data(previous_year),
                               provider.revenue_data(current_year))
    @booking_data = chart_data(provider.booking_data(previous_year),
                               provider.booking_data(current_year))
  end

  def new
    @provider = Provider.new
    @provider.build_user
    session[:additional] = 'Provider'
  end

  def create
    @provider = Provider.create
    @provider.user = @provider.build_user(provider_params[:user_attributes])
    @provider.user.person = @provider
    if @provider.save
      redirect_to new_session_path
    else
      render new_provider_path
    end
  end

  private

  def provider_params
    params.require(:provider).permit(user_attributes: [:first_name,
                                                       :last_name,
                                                       :email,
                                                       :phone_number,
                                                       :gender,
                                                       :password,
                                                       :password_confirmation])
  end
end
