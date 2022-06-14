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
  end
end
