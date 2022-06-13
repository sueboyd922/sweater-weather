class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    user.api_key = SecureRandom.hex(14)
    if user.save
      require "pry"; binding.pry
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
