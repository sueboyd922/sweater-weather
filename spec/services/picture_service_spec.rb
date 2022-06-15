require 'rails_helper'

RSpec.describe PictureService do
  it 'returns info for a picture' do
    search = "boston,ma"

    picture = PictureService.get_photo(search)

    expect(picture).to have_key(:urls)
    expect(picture[:urls]).to have_key(:raw)
    expect(picture[:urls]).to have_key(:regular)
    expect(picture[:links]).to have_key(:download)
    expect(picture[:user]).to have_key(:username)
    expect(picture[:user]).to have_key(:name)
    expect(picture[:user][:links]).to have_key(:self)
    expect(picture[:location]).to have_key(:title)
  end
end
