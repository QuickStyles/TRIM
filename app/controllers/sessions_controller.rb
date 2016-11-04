class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:email]
    session[:user_id] = user.id if user.present? && user.authenticate(params[:password])
    if user_signed_in? && current_user.person_type == 'Provider'
      redirect_to providers_path
    elsif user_signed_in? && current_user.person_type == 'Customer'
      redirect_to customers_path
    else
      render :new, notice: 'Error signing in'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:person_id] = nil
    redirect_to root_path
  end
end
