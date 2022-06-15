class Api::V1::RoadTripController < ApplicationController
  before_action :valid_api_key?, only: [:show]
  before_action :road_trip_params_present?, only: [:show]

  def show
    travel_time = MapFacade.get_travel_time(params[:destination], params[:origin])
    location = MapFacade.get_location(params[:destination])
    weather = WeatherFacade.get_full_weather(location.lat, location.long)
    roadtrip_success(travel_time, weather)
  end


  private
  def trip_params
    params.require(:road_trip).permit(:origin, :destination, :api_key)
  end

  def valid_api_key?
    if params[:api_key].present?
       if !User.exists?(api_key: params[:api_key])
         error("Invalid API key", 401)
       end
    else
      error("Missing API key", 401)
    end
  end

  def road_trip_params_present?
    unless params[:destination].present? && params[:origin].present?
      error("Missing destination or origin locations", 400)
    end
  end
end
