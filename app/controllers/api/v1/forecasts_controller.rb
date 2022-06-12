class Api::V1::ForecastsController < ApplicationController

  def show
    location = MapFacade.get_location(params[:location])
    require "pry"; binding.pry
  end

end
