require 'rails_helper'

RSpec.describe Picture do
  describe 'initialize' do
    it 'exists with attributes' do
      search = "boston,ma"
      data = File.read("./spec/fixtures/picture_sample_response.json")
      photo_info = JSON.parse(data, symbolize_names: true)

      photo = Picture.new(photo_info, search)

      expect(photo.location).to eq(photo_info[:location][:title])
      expect(photo.image_url).to eq(photo_info[:urls][:regular])
      expect(photo.raw_url).to eq(photo_info[:urls][:raw])
      expect(photo.download).to eq(photo_info[:links][:download])
      expect(photo.artist).to eq(photo_info[:user][:name])
      expect(photo.artist_username).to eq(photo_info[:user][:username])
      expect(photo.source).to eq("unsplash.com")
      expect(photo.query).to eq(search)
    end
  end
end
