require 'rails_helper'

RSpec.describe WeatherService do
  it 'returns the weather info' do
    lat = 42.35889
    long = -71.056742
    weather = WeatherService.get_weather(lat, long)

    expect(weather).to have_key(:current)
    expect(weather[:current]).to have_key(:dt)
    expect(weather[:current]).to have_key(:sunrise)
    expect(weather[:current]).to have_key(:sunset)
    expect(weather[:current]).to have_key(:temp)
    expect(weather[:current]).to have_key(:feels_like)
    expect(weather[:current]).to have_key(:humidity)
    expect(weather[:current]).to have_key(:uvi)
    expect(weather[:current]).to have_key(:visibility)
    expect(weather[:current]).to have_key(:weather)
    expect(weather[:current][:weather][0]).to have_key(:description)
    expect(weather[:current][:weather][0]).to have_key(:icon)

    expect(weather).to have_key(:hourly)
    expect(weather[:hourly][0]).to have_key(:dt)
    expect(weather[:hourly][0]).to have_key(:temp)
    expect(weather[:hourly][0]).to have_key(:weather)
    expect(weather[:hourly][0][:weather][0]).to have_key(:description)
    expect(weather[:hourly][0][:weather][0]).to have_key(:icon)

    expect(weather).to have_key(:daily)
    expect(weather[:daily][0]).to have_key(:dt)
    expect(weather[:daily][0]).to have_key(:sunrise)
    expect(weather[:daily][0]).to have_key(:sunset)
    expect(weather[:daily][0]).to have_key(:temp)
    expect(weather[:daily][0][:temp]).to have_key(:min)
    expect(weather[:daily][0][:temp]).to have_key(:max)
    expect(weather[:daily][0]).to have_key(:weather)
    expect(weather[:daily][0][:weather][0]).to have_key(:description)
    expect(weather[:daily][0][:weather][0]).to have_key(:icon)
  end
end
