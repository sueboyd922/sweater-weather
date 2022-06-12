require 'rails_helper'

RSpec.describe "weather api" do
  describe 'it returns an array of weather for a location' do
    it 'returns all of the weather info' do
      city = "boston,ma"

      get "/api/v1/forecast?location=#{city}"

      expect(response).to be_successful
      weather_response = JSON.parse(response.body, symbolize_names: true)

      expect(weather_response[:data]).to have_key(:id)
      expect(weather_response[:data]).to eq(nil)
      expect(weather_response[:data]).to have_key(:type)
      expect(weather_response[:data]).to eq("forecast")

      weather = weather_response[:data]

      expect(weather[:attributes]).to be_a Hash
      expect(weather[:attributes]).to have_key(:current_weather)
      expect(weather[:attributes][:current_weather]).to be_a Hash
      expect(weather[:attributes]).to have_key(:daily_weather)
      expect(weather[:attributes][:daily_weather]).to be_an Array
      expect(weather[:attributes]).to have_key(:hourly_weather)
      expect(weather[:attributes][:hourly_weather]).to be_an Array
    end
  end
end
