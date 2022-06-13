require 'rails_helper'

RSpec.describe DailyWeather do
  describe 'initialize' do
    it 'exists with attributes' do
      data = File.read("./spec/fixtures/open_weather_response.json")
      weather = JSON.parse(data, symbolize_names: true)

      daily = DailyWeather.new(weather[:daily].first)

      expect(daily.date).to eq("2022-06-12")
      expect(daily.sunrise).to eq(Time.at(1655024821))
      expect(daily.sunset).to eq(Time.at(1655079681))
      expect(daily.max_temp).to eq(77.27)
      expect(daily.min_temp).to eq(58.28)
      expect(daily.conditions).to eq("light rain")
      expect(daily.icon).to eq("10d")
    end
  end
end
