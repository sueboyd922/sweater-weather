class Photo
  attr_reader :location, :image_url, :raw_url, :download, :query, :artist, :artist_username, :artist_link, :source

  def initialize(data, query)
    @location = data[:location][:title]
    @image_url = data[:urls][:regular]
    @raw_url = data[:urls][:raw]
    @download = data[:links][:download]
    @query = query
    @artist = data[:user][:name]
    @artist_username = data[:user][:username]
    @artist_link = data[:user][:links][:self]
    @source = "unsplash.com"
  end
end
