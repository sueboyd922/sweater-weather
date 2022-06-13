class BookFacade

  def self.get_books(location, quantity)
    quantity = 10 if quantity.nil? || quantity == ""
    json = BookService.get_books(location)
    BookSearch.new(location, json, quantity.to_i)
  end
end
