class Api::V1::LandingController < ApplicationController

  def forecast
    location = MapFacade.get_location(params[:location])
    weather = WeatherFacade.get_weather(location.lat, location.long)
  end

end
