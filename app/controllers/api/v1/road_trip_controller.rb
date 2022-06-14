class Api::V1::RoadTripController < ApplicationController

  def show
    if User.exists?(api_key: params[:api_key])
      #get travel time
      #get weather at destination
      travel_time = MapFacade.get_travel_time(params[:destination], params[:origin])
      location = MapFacade.get_location(params[:destination])
      weather = WeatherFacade.get_full_weather(location.lat, location.long)
      require "pry"; binding.pry
    end
  end


  private
  def trip_params
    params.require(:road_trip).permit(:origin, :destination, :api_key)
  end
end
