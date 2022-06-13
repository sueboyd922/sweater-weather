class BookForecastSerializer

  def self.create(book_search, weather)
    {
      data: {
        id: "null",
        type: "books",
        attributes: {
          destination: book_search.search,
          forecast: {
            summary: weather.conditions,
            temperature: weather.temp
          },
          total_books_found: book_search.num_results,
          books: book_search.books.map do |book|
            {
              isbn: book.isbn,
              title: book.title,
              publisher: book.publisher
            }
          end
        }
      }
    }
  end
end
