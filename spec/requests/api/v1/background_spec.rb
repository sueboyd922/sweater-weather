require 'rails_helper'

RSpec.describe 'Background Api Call' do
  it 'returns one photo' do
    city = "boston,ma"

    get "/api/v1/backgrounds?location=#{city}"

    expect(response).to be_successful

    background_response = JSON.parse(response.body, symbolize_names: true)
    background = background_response[:data]

    expect(background_response[:data]).to have_key(:type)
    expect(background_response[:data][:type]).to eq("image")
    expect(background_response[:data][:search]).to eq(city)
    expect(background[:attributes]).to be_a Hash
    expect(background[:attributes][:image]).to be_a Hash
    expect(background[:attributes][:image][:location]).to be_a String
    expect(background[:attributes][:image][:image_url]).to be_a String
    expect(background[:attributes][:image][:raw_url]).to be_a String
    expect(background[:attributes][:image][:download]).to be_a String
    expect(background[:attributes][:credit]).to be_a Hash
    expect(background[:attributes][:credit][:source]).to eq("unsplash.com")
    expect(background[:attributes][:credit][:artist]).to be_a String
    expect(background[:attributes][:credit][:artist_username]).to be_a String
    expect(background[:attributes][:credit][:artist_link]).to be_a String
  end
end
