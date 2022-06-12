require 'rails_helper'

RSpec.describe 'Background Api Call' do
  it 'returns one photo' do
    city = "boston,ma"

    get "/api/v1/backgrounds?location=#{city}"

    expect(response).to be_successful

    background_response = JSON.parse(response.body, symbolize_names: true)
  end
end
