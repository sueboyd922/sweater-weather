require 'rails_helper'

RSpec.describe BookService do
  xit 'returns book info' do
    search = "buffalo,ny"

    books = BookService.get_books(search)

    expect(books).to have_key(:numFound)
    expect(books).to have_key(:docs)
    expect(books[:docs]).to be_an Array
    expect(books[:docs].first).to be_a Hash
    expect(books[:docs].first).to have_key(:title)
    expect(books[:docs][0][:publisher]).to be_an Array
    expect(books[:docs][0][:isbn]).to be_an Array
  end
end
