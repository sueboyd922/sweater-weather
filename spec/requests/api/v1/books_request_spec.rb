require 'rails_helper'

RSpec.describe "Book/Weather API request" do
  describe 'book search endpoint' do
    it 'returns books and forecast for a city' do
      search = "raleigh,nc"
      quantity = 5

      get "/api/v1/book-search?location=#{search}&quantity=#{quantity}"

      expect(response).to be_successful
      returned_response = JSON.parse(response.body, symbolize_names: true)
      returned = returned_response[:data]

      expect(returned).to have_key(:id)
      expect(returned[:id]).to eq("null")
      expect(returned).to have_key(:type)
      expect(returned[:type]).to eq("books")
      expect(returned[:attributes]).to have_key(:destination)
      expect(returned[:attributes][:destination]).to eq(search)
      expect(returned[:attributes]).to have_key(:total_books_found)
      expect(returned[:attributes][:forecast]).to be_a Hash
      expect(returned[:attributes][:forecast]).to have_key(:summary)
      expect(returned[:attributes][:forecast]).to have_key(:temperature)
      expect(returned[:attributes][:books]).to be_an Array
      expect(returned[:attributes][:books].count).to eq(quantity)
      expect(returned[:attributes][:books].first).to be_a Hash
      expect(returned[:attributes][:books].first).to have_key(:isbn)
      expect(returned[:attributes][:books].first).to have_key(:title)
      expect(returned[:attributes][:books].first).to have_key(:publisher)
    end

    it 'returns an error if the location param is missing' do
      quantity = 5

      get "/api/v1/book-search?quantity=#{quantity}"

      expect(response.status).to eq(404)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error).to have_key(:error)
      expect(error[:error]).to eq("Missing location")
    end

    it 'returns an error if the quantity is less than or equal to 0' do
      quantity = -4
      search = "raleigh,nc"

      get "/api/v1/book-search?location=#{search}&quantity=#{quantity}"

      expect(response.status).to eq(400)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error).to have_key(:error)
      expect(error[:error]).to eq("Invalid Quantity")
    end

    it 'defaults to a quantity of 10 if no quantity present' do
      search = "raleigh,nc"

      get "/api/v1/book-search?location=#{search}&quantity="

      expect(response).to be_successful
      returned_response = JSON.parse(response.body, symbolize_names: true)
      returned = returned_response[:data]

      expect(returned[:attributes][:books].count).to eq(10)
    end

    it 'defaults to a quantity of 10 if no quantity given' do
      search = "raleigh,nc"

      get "/api/v1/book-search?location=#{search}"

      expect(response).to be_successful
      returned_response = JSON.parse(response.body, symbolize_names: true)
      returned = returned_response[:data]

      expect(returned[:attributes][:books].count).to eq(10)
    end

    it 'returns an error if the quantity is not an integer' do
      search = "raleigh,nc"
      quantity = "severussnape"

      get "/api/v1/book-search?location=#{search}&quantity=#{quantity}"
      expect(response.status).to eq(400)
      error = JSON.parse(response.body, symbolize_names: true)
      expect(error).to have_key(:error)
      expect(error[:error]).to eq("Invalid Quantity")
    end
  end
end
