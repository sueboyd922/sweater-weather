require 'rails_helper'

RSpec.describe 'user registration request' do
  it 'creates a user' do
    user_params = {
      email: "email@example.com",
      password: "secret",
      password_confirmation: "secret"
    }
    headers = {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }

    post "/api/v1/users", headers: headers, params: JSON.generate(user_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user_response_json = JSON.parse(response.body, symbolize_names: true)
    user_response = user_response_json[:data]

    expect(user_response[:type]).to eq("user")
    expect(user_response[:id]).to be_a Integer
    expect(user_response[:attributes][:email]).to eq(user_params[:email])
    expect(user_response[:attributes][:api_key]).to be_a String
    expect(user_response[:attributes]).not_to have_key(:password)
    expect(user_response[:attributes]).not_to have_key(:password_confirmation)
  end
end
