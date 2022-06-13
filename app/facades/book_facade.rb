class BookFacade

  def self.get_books(location, quantity)
    json = BookService.get_books(location)
    BookSearch.new(json, quantity)
  end
end
