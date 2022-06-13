require 'rails_helper'

RSpec.describe "Book/Weather API request" do
  describe 'book search endpoint' do
    it 'returns books and forecast for a city' do
      search = "raleigh,nc"
      quantity = 5

      get "/api/v1/book-search?location=#{search}&quantity=#{quantity}"

      expect(response).to be_successful
    end
  end
end
