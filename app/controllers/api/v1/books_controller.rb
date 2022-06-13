class Api::V1::BooksController < ApplicationController
  before_action :search_present?, only: [:search]
  before_action :quantity_above_0?, only: [:search]

  def search
    weather = WeatherFacade.get_weather(@location.lat, @location.long)
    books = BookFacade.get_books(params[:location], params[:quantity])
    if !books.instance_of?(BookSearch)
      render json: books, status: 404
    else
      render json: BookForecastSerializer.create(books, weather.current_weather)
    end
  end

  def search_present?
    if !params[:location].present? || params[:location] == ""
      render json: {"error" => "Missing location"}, status: 404
    else
      @location = MapFacade.get_location(params[:location])
    end
  end

  def quantity_above_0?
    if params[:quantity].present? && params[:quantity].to_i <= 0
      render json: {"error" => "Invalid Quantity"}, status: 400
    end
  end
end
