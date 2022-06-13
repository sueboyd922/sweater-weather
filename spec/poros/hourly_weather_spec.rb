require 'rails_helper'

RSpec.describe HourlyWeather do
  describe 'initialize' do
    it 'exists with attributes' do
      data = File.read("./spec/fixtures/open_weather_response.json")
      weather = JSON.parse(data, symbolize_names: true)

      hourly = HourlyWeather.new(weather[:hourly].first)

      expect(hourly.time).to eq("21:00:00")
      expect(hourly.temp).to eq(68.92)
      expect(hourly.conditions).to eq("overcast clouds")
      expect(hourly.icon).to eq("04n")
    end
  end
end
