class Api::V1::BooksController < ApplicationController
  def search
    location = MapFacade.get_location(params[:location])
    weather = WeatherFacade.get_weather(location.lat, location.long)
    books = BookFacade.get_books(params[:location], params[:quantity])
  end
end
