require 'rails_helper'

RSpec.describe Location do
  describe 'initialize' do
    it 'exists with attributes' do
      json = File.read("./spec/fixtures/map_response.json")
      data = JSON.parse(json, symbolize_names: true)

      location = Location.new(data)
      expect(location.lat).to eq(42.358894)
      expect(location.long).to eq(-71.056742)
    end
  end
end
