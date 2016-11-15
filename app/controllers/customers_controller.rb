class CustomersController < ApplicationController
  def index
    @bookings = current_user.person.bookings.where('created_at >= ?', 1.week.ago).order(created_at: :desc)
    @services = Service.where.not(latitude: nil)
  end

  def show
    @bookings = current_user.person.bookings.order(time_start: :desc)
  end

  def new
    @customer = Customer.new
    @customer.build_user
    session[:additional] = 'Customer'
  end

  def create
    @customer = Customer.create
    @customer.user = @customer.build_user(customer_params[:user_attributes])
    @customer.user.person = @customer
    if @customer.save
      redirect_to new_session_path
    else
      render new_customer_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(user_attributes: [:first_name,
                                                       :last_name,
                                                       :email,
                                                       :phone_number,
                                                       :gender,
                                                       :password,
                                                       :password_confirmation])
  end
end
