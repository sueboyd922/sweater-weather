class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def create
    user = User.new(user_params)
    if user.save
      user_success(user, 201)
    else
      error(user.errors.full_messages.to_sentence, 400)
    end
  end

  def show
    if @user.authenticate(params[:password])
      user_success(@user, 200)
    else
      error("Email or password is incorrect", 401)
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
