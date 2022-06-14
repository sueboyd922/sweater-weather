class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.send_user(user), status: :created
    end
  end

  def show
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: UserSerializer.send_user(user)
    else
      render json: {error: "Email or password is incorrect"}, status: 400
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
