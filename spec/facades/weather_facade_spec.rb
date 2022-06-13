require 'rails_helper'

RSpec.describe WeatherFacade do
  it 'returns the weather in a Forecast' do
    lat = 42.35889
    long = -71.056742
    data = File.read("./spec/fixtures/open_weather_response.json")
    weather = JSON.parse(data, symbolize_names: true)

    allow(WeatherService).to receive(:get_weather).and_return(weather)

    forecast = WeatherFacade.get_weather(lat, long)
    expect(forecast).to be_a Forecast
  end
end
