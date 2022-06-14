module ResponseHelper

  def user_success(user, code)
    render json: UserSerializer.send_user(user), status: code
  end

  def roadtrip_success(travel, weather)
    render json: RoadTripSerializer.new_trip(travel, weather)
  end

  def error(message, code)
    render json: {error: message}, status: code
  end
end
