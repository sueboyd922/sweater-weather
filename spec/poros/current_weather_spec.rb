require 'rails_helper'

RSpec.describe CurrentWeather do
  describe 'initialize' do
    it 'exists with attributes' do
      data = File.read("./spec/fixtures/open_weather_response.json")
      weather = JSON.parse(data, symbolize_names: true)

      current = CurrentWeather.new(weather[:current])
      expect(current.date_time).to eq(Time.at(1655082478))
      expect(current.sunrise).to eq(Time.at(1655024821))
      expect(current.sunset).to eq(Time.at(1655079681))
      expect(current.feels_like).to eq(69.08)
      expect(current.temp).to eq(68.92)
      expect(current.humidity).to eq(76)
      expect(current.uvi).to eq(0)
      expect(current.visibility).to eq(10000)
      expect(current.conditions).to eq("overcast clouds")
      expect(current.icon).to eq("04n")

    end
  end
end
