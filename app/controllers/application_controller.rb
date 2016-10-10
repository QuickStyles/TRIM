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
end
