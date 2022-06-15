require 'rails_helper'

RSpec.describe Travel do
  it 'returns info about a roadtrip' do
    data = File.read("./spec/fixtures/road_trip_sample_response.json")
    roadtrip = JSON.parse(data, symbolize_names: true)
    to = "Denver, CO"
    from = "Boston, MA"

    travel = Travel.new(roadtrip, to, from)
    
    expect(travel.time_in_string).to eq("1 day, 5 hours, 13 minutes, and 51 seconds")
    expect(travel.time_in_days).to eq(1)
    expect(travel.time_in_hours).to eq(29)
    expect(travel.destination).to eq(to)
    expect(travel.origin).to eq(from)
  end
end
