class BookService < BaseService

  def self.get_books(location)
    query = location.sub(",", "+")
    response = connection.get("search.json?q=#{query}")
    get_json(response)
  end

  def self.connection
    conn("http://openlibrary.org/")
  end
end
