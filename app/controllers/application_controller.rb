class ApplicationController < ActionController::API
  include ResponseHelper

  def set_user
    if User.exists?(email: params[:email])
      @user = User.find_by(email: params[:email])
    else
      login_error
    end
  end
end
