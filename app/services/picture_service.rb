class PictureService < BaseService

  def self.get_photo(search)
    response = connection.get("/photos/random?client_id=#{ENV['photo_access']}&query=#{search}")
    get_json(response)
  end

  def self.connection
    conn("https://api.unsplash.com")
  end
end
