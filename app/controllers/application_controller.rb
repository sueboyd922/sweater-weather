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
end
