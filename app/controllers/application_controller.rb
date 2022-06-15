class ApplicationController < ActionController::API
  include ResponseHelper

  def set_user
    if User.exists?(email: params[:email])
      @user = User.find_by(email: params[:email])
    else
      error("Email or password is incorrect", 401)
    end
  end

  # def valid_api_key?
  #   if params[:api_key].present?
  #      if !User.exists?(api_key: params[:api_key])
  #        error("Invalid API key", 401)
  #      end
  #   else
  #     error("Missing API key", 401)
  #   end
  # end

  # def road_trip_params_present?
  #   unless params[:destination].present? && params[:origin].present?
  #     error("Missing destination or origin locations", 400)
  #   end
  # end
end
