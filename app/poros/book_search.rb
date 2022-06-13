class BookSearch

  def initialize(data, quantity)
    @num_results = data[:numFound]
    @books = create_books(data[:docs][0..(quantity - 1)])
  end

  def create_books(books)
    books.map {|book| Book.new(book)}
  end
end
