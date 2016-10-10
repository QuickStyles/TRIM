class CustomersController < ApplicationController
  def index
    @services = Service.all
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
