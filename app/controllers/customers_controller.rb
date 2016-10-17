class CustomersController < ApplicationController
  def index
    @bookings = current_user.person.bookings.where('created_at >= ?', 1.week.ago)
  end

  def show
    @bookings = current_user.person.bookings
  end

  def new
    @customer = Customer.new
    @customer.build_user
    session[:additional] = 'Customer'
  end

  def create
    @customer = Customer.new
    @customer.user = @customer.build_user(customer_params[:user_attributes])
    @customer.user.person = @customer
    if @customer.save
      redirect_to root_path
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
