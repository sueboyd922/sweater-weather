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

    get "/api/v1/users", headers: headers, params: user_params.to_json
  end
end
