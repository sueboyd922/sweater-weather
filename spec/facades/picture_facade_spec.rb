require 'rails_helper'

RSpec.describe PictureFacade do
  it 'returns a Location from a json' do
    city = 'boston,ma'
    data= File.read("./spec/fixtures/map_response.json")
    response = JSON.parse(data, symbolize_names: true)

    allow(PictureService).to receive(:get_photo).and_return(response)

    location = MapFacade.get_location(city)

    expect(location).to be_a Location
  end
end
