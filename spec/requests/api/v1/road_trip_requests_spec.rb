require 'rails_helper'

RSpec.describe "directions/weather api request" do
  it 'returns a time and weather for a destination' do
    user = User.create!(email: "trip@mail.com", password: "12345", password_confirmation: "12345")

    request_params = {
      origin: "Boston, MA",
      destination: "Raleigh, NC",
      api_key: user.api_key
    }

    headers = {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(request_params)

    expect(response).to be_successful

    road_trip_response = JSON.parse(response.body, symbolize_names: true)
    road_trip = road_trip_response[:data]

    expect(road_trip[:id]).to eq("null")
    expect(road_trip[:type]).to eq("roadtrip")
    expect(road_trip[:attributes][:start_city]).to eq(request_params[:origin])
    expect(road_trip[:attributes][:end_city]).to eq(request_params[:destination])
    expect(road_trip[:attributes][:travel_time]).to be_a String
    expect(road_trip[:attributes][:weather_at_eta]).to be_a Hash
    expect(road_trip[:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(road_trip[:attributes][:weather_at_eta]).to have_key(:conditions)
  end

  it 'returns an error if the api key is wrong or does not exist' do
    user = User.create!(email: "trip@mail.com", password: "12345", password_confirmation: "12345")

    request_params = {
      origin: "Boston, MA",
      destination: "Raleigh, NC",
      api_key: "aen293jfove0"
    }

    headers = {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(request_params)
    require "pry"; binding.pry
    expect(response.status).to eq(401)

    road_trip_response = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip_response[:error]).to eq("Invalid API key")
  end

  it 'returns an error if no api key is sent' do
    user = User.create!(email: "trip@mail.com", password: "12345", password_confirmation: "12345")

    request_params = {
      origin: "Boston, MA",
      destination: "Raleigh, NC"
    }

    headers = {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(request_params)

    expect(response.status).to eq(401)

    road_trip_response = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip_response[:error]).to eq("Missing API key")
  end

  it 'returns an error if no origin is entered' do
    user = User.create!(email: "trip@mail.com", password: "12345", password_confirmation: "12345")

    request_params = {
      destination: "Raleigh, NC",
      api_key: user.api_key
    }

    headers = {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(request_params)

    expect(response.status).to eq(400)

    road_trip_response = JSON.parse(response.body, symbolize_names: true)
    expect(road_trip_response[:error]).to eq("Missing destination or origin locations")
  end

  it 'returns an error if no destination is entered' do
    user = User.create!(email: "trip@mail.com", password: "12345", password_confirmation: "12345")

    request_params = {
      origin: "Boston, MA",
      api_key: user.api_key
    }

    headers = {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }

    post "/api/v1/road_trip", headers: headers, params: JSON.generate(request_params)

    expect(response.status).to eq(400)

    road_trip_response = JSON.parse(response.body, symbolize_names: true)
  end
end
