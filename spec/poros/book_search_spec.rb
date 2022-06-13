require 'rails_helper'

RSpec.describe BookSearch do
  describe 'initialize' do
    it 'exists with attributes' do
      search = "raleigh,nc"
      quantity = 10
      data = File.read("./spec/fixtures/sample_book_response.json")
      json = JSON.parse(data, symbolize_names: true)

      book_search = BookSearch.new(search, json, quantity)
      expect(book_search.num_results).to eq(649)
      expect(book_search.books).to be_an Array
      expect(book_search.books.count).to eq(quantity)
      expect(book_search.books.first).to be_a Book
      expect(book_search.search).to eq(search)
    end
  end
end
