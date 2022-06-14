class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def create
    user = User.new(user_params)
    if user.save
      success(user, 201)
    end
  end

  def show
    if @user.authenticate(params[:password])
      success(@user, 200)
    else
      login_error
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
