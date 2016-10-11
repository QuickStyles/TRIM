class CallbacksController < ApplicationController
  def google_oauth2_response
    omniauth_data = request.env["omniauth.auth"]
    user = User.find_from_omniauth(omniauth_data)
    if session[:additional] == 'Provider'
      user ||= User.create_provider_from_omniauth(omniauth_data)
      session.delete(:additional)
      sign_in(user)
    elsif session[:additional] == 'Customer'
      user ||= User.create_customer_from_omniauth(omniauth_data)
      session.delete(:additional)
      sign_in(user)
    else
      session.delete(:additional)
      sign_in(user)
    end
    session[:google_access_token] = omniauth_data['credentials']['token']
    session[:google_access_refresh_token] = omniauth_data['credentials']['refresh_token']
    redirect_to root_path, notice: "Signed in from google"
  end
end
