require 'rails_helper'

RSpec.describe MapService do
  it 'gets a locations longitude and latitude' do
    query = "Boston, MA"

    map_service = MapService.get_location(query)

    expect(map_service).to have_key(:results)
    expect(map_service[:results]).to be_an Array
    expect(map_service[:results][0]).to have_key(:locations)
    expect(map_service[:results][0][:locations]).to be_an Array
    expect(map_service[:results][0][:locations][0]).to have_key(:latLng)
    expect(map_service[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(map_service[:results][0][:locations][0][:latLng]).to have_key(:lng)
  end

  it 'gets the travel time between two destinations' do
    to = "Raleigh, NC"
    from = "Boston, MA"

    map_service = MapService.get_travel_time(to, from)

    expect(map_service).to have_key(:route)
    expect(map_service[:route]).to have_key(:legs)
    expect(map_service[:route][:legs]).to be_an Array
    expect(map_service[:route][:legs][0]).to have_key(:time)
    expect(map_service[:route][:legs][0][:time]).to be_an Integer
  end
end
