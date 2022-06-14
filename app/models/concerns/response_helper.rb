module ResponseHelper

  def success(user, code)
    render json: UserSerializer.send_user(user), status: code
  end

  def roadtrip_success(travel, weather)
    render json: RoadTripSerializer.new_trip(travel, weather)
  end

  def login_error
    render json: {error: "Email or password is incorrect"}, status: 400
  end

  def creation_error(user, code)
    render json: {error: user.errors.full_messages.to_sentence}, status: 400
  end

  def api_key_error(message)
    render json: {error: message}, status: 401
  end

end
