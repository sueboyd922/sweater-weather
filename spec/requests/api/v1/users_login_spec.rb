require 'rails_helper'

RSpec.describe 'users login response' do
  it 'lets a registered user log in' do
    user = User.create!(email: "fake@email.com", password: "titanic", password_confirmation: "titanic")

    login_info = {
      email: user.email,
      password: user.password
    }

    headers = {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }

    post "/api/v1/sessions", headers: headers, params: JSON.generate(login_info)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    user_response_json = JSON.parse(response.body, symbolize_names: true)
    user_response = user_response_json[:data]

    expect(user_response[:type]).to eq("user")
    expect(user_response[:id]).to be_a Integer
    expect(user_response[:attributes][:email]).to eq(user.email)
    expect(user_response[:attributes][:api_key]).to eq(user.api_key)
    expect(user_response[:attributes]).not_to have_key(:password)
    expect(user_response[:attributes]).not_to have_key(:password_confirmation)
  end

  it 'does not let you log in if you have wrong password' do
    user = User.create!(email: "fake@email.com", password: "titanic", password_confirmation: "titanic")

    login_info = {
      email: user.email,
      password: "wrong"
    }

    headers = {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }

    post "/api/v1/sessions", headers: headers, params: JSON.generate(login_info)

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(user_response[:error]).to eq("Email or password is incorrect")
  end

  it 'does not let you log in if you have wrong email' do
    user = User.create!(email: "fake@email.com", password: "titanic", password_confirmation: "titanic")

    login_info = {
      email: "fake_email@email.com",
      password: user.password
    }

    headers = {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }

    post "/api/v1/sessions", headers: headers, params: JSON.generate(login_info)

    user_response = JSON.parse(response.body, symbolize_names: true)
    
    expect(response.status).to eq(401)
    expect(user_response[:error]).to eq("Email or password is incorrect")
  end
end
