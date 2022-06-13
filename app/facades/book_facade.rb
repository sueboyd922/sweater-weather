class BookFacade

  def self.get_books(location, quantity)
    json = BookService.get_books(location)
    json.map {|data| Book.new(data)}
  end
end
