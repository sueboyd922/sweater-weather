class ApplicationController < ActionController::API

  def set_user
    if User.exists?(email: params[:email])
      @user = User.find_by(email: params[:email])
    else
      login_error
    end
  end

  def success(user, code)
    render json: UserSerializer.send_user(user), status: code
  end

  def login_error
    render json: {error: "Email or password is incorrect"}, status: 400
  end

  def creation_error(user, code)
    render json: {error: user.errors.full_messages.to_sentence}, status: 400
  end
end
