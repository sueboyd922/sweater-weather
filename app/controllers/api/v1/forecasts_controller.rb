class Api::V1::ForecastsController < ApplicationController

  def show
    location = MapFacade.get_location(params[:location])
  end

end
