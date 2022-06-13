require 'rails_helper'

RSpec.describe Book do
  describe 'initialize' do
    it 'exists with attributes' do
      data = File.read("./spec/fixtures/sample_book_response.json")
      json = JSON.parse(data, symbolize_names: true)
      book_info = json[:docs][3]

      book = Book.new(book_info)
      expect(book.title).to eq("Raleigh, NC Wall Map")
      expect(book.publisher).to eq(["Universal Map"])
      expect(book.isbn).to eq(["076250837X", "9780762508372"])
    end
  end
end
