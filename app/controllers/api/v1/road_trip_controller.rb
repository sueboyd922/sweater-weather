class Api::V1::RoadTripController < ApplicationController
  before_action :valid_api_key?, only: [:show]

  def show
    travel_time = MapFacade.get_travel_time(params[:destination], params[:origin])
    location = MapFacade.get_location(params[:destination])
    weather = WeatherFacade.get_full_weather(location.lat, location.long)
    render json: RoadTripSerializer.new_trip(travel_time, weather)
  end


  private
  def trip_params
    params.require(:road_trip).permit(:origin, :destination, :api_key)
  end
end
