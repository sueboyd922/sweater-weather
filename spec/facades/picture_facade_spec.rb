require 'rails_helper'

RSpec.describe PictureFacade do
  it 'returns a picture from a search' do
    city = 'boston,ma'
    data= File.read("./spec/fixtures/picture_sample_response.json")
    response = JSON.parse(data, symbolize_names: true)

    allow(PictureService).to receive(:get_photo).and_return(response)

    picture_facade = PictureFacade.get_photo(city)
    expect(picture_facade).to be_a Picture
  end
end
