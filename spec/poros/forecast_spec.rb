require 'rails_helper'

RSpec.describe Forecast do
  describe 'initialize' do
    it 'exists with attributes' do
      data = File.read("./spec/fixtures/open_weather_response.json")
      weather = JSON.parse(data, symbolize_names: true)

      forecast = Forecast.new(weather)

      expect(forecast.current_weather).to be_a CurrentWeather
      expect(forecast.daily_weather).to be_an Array
      expect(forecast.daily_weather.count).to eq(5)
      expect(forecast.daily_weather.first).to be_a DailyWeather
      expect(forecast.hourly_weather).to be_an Array
      expect(forecast.hourly_weather.count).to eq(8)
      expect(forecast.hourly_weather.first).to be_a HourlyWeather
    end
  end
end
