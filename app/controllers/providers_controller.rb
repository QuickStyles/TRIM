class ProvidersController < ApplicationController
  def new
    @provider = Provider.new
    @provider.build_user
  end

  def create
    @provider = Provider.new
    @provider.user = @provider.build_user(provider_params[:user_attributes])
    @provider.user.person = @provider
    if @provider.save
      redirect_to root_path
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

  # def user_params
  #   params.require(:provider[:user_attributes]).permit(:first_name, :last_name, :email, :phone_number, :gender, :password, :password_confirmation)
  # end
end
