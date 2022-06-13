require 'rails_helper'

RSpec.describe BookFacade do
  it 'returns books associated with a location search' do
    json = File.read("./spec/fixtures/sample_book_response.json")
    data = JSON.parse(json, symbolize_names: true)

    allow(BookService).to receive(:get_books).and_return(data)

    search = "raleigh,nc"
    quantity = 8

    book_search = BookFacade.get_books(search, quantity)
    expect(book_search).to be_a BookSearch
    expect(book_search.search).to eq(search)
    expect(book_search.books.count).to eq(quantity)
  end
end
