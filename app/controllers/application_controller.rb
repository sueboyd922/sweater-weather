class ApplicationController < ActionController::API
  include ResponseHelper

  def set_user
    if User.exists?(email: params[:email])
      @user = User.find_by(email: params[:email])
    else
      login_error
    end
  end

  def valid_api_key?
    if params[:api_key].present?
      api_key_error("Invalid API key") if !User.exists?(api_key: params[:api_key])
    else
      api_key_error("Missing API key")
    end
  end

  def road_trip_params_present?
    unless params[:destination].present? && params[:origin].present?
      roadtrip_error("Missing destination or origin locations")
    end
  end

  # def find_location
  #   @location = MapFacade.get_location(params[:destination])
  #   if @location.instance_of?(String)
  #     location_error(@location)
  #   end
  # end
end
