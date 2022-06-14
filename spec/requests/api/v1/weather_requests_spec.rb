require 'rails_helper'

RSpec.describe "weather api" do
  describe 'it returns an array of weather for a location' do
    it 'returns all of the weather info' do
      city = "boston,ma"

      get "/api/v1/forecast?location=#{city}"

      expect(response).to be_successful
      weather_response = JSON.parse(response.body, symbolize_names: true)

      expect(weather_response[:data]).to have_key(:id)
      expect(weather_response[:data][:id]).to eq(nil)
      expect(weather_response[:data]).to have_key(:type)
      expect(weather_response[:data][:type]).to eq("forecast")

      all_weather = weather_response[:data]
      weather = all_weather[:attributes]

      expect(all_weather[:attributes]).to be_a Hash

      expect(all_weather[:attributes]).to have_key(:current_weather)
      expect(weather[:current_weather]).to be_a Hash
      expect(weather[:current_weather][:datetime]).to be_a String
      expect(weather[:current_weather][:temperature]).to be_a(Float).or be_an(Integer)
      expect(weather[:current_weather][:feels_like]).to be_a(Float).or be_an(Integer)
      expect(weather[:current_weather][:humidity]).to be_an Integer
      expect(weather[:current_weather][:uvi]).to be_an Integer
      expect(weather[:current_weather][:sunrise]).to be_a String
      expect(weather[:current_weather][:sunset]).to be_a String
      expect(weather[:current_weather][:conditions]).to be_a String
      expect(weather[:current_weather][:icon]).to be_a String

      expect(all_weather[:attributes]).to have_key(:daily_weather)
      expect(weather[:daily_weather]).to be_an Array
      expect(weather[:daily_weather].count).to eq(5)
      expect(weather[:daily_weather][0][:date]).to be_a String
      expect(weather[:daily_weather][0][:max_temp]).to be_a(Float).or be_an(Integer)
      expect(weather[:daily_weather][0][:min_temp]).to be_a(Float).or be_an(Integer)
      expect(weather[:daily_weather][0][:sunrise]).to be_a String
      expect(weather[:daily_weather][0][:sunset]).to be_a String
      expect(weather[:daily_weather][0][:conditions]).to be_a String
      expect(weather[:daily_weather][0][:icon]).to be_a String

      expect(all_weather[:attributes]).to have_key(:hourly_weather)
      expect(weather[:hourly_weather]).to be_an Array
      expect(weather[:hourly_weather].count).to eq(8)
      expect(weather[:hourly_weather][0][:time]).to be_a String
      expect(weather[:hourly_weather][0][:temperature]).to be_a(Float).or be_an(Integer)
      expect(weather[:hourly_weather][0][:conditions]).to be_a String
      expect(weather[:hourly_weather][0][:icon]).to be_a String
    end
  end
end
