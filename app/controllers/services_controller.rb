class ServicesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new service_params
    @service.provider_id = current_user.person_id
    if @service.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :rate, :certified, :location, :duration)
  end
end
