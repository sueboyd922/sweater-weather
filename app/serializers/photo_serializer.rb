class PhotoSerializer

  def self.new_photo(photo)
    {
      data: {
        type: "image",
        id: nil,
        search: photo.query,
        attributes: {
          image: {
            location: photo.location,
            image_url: photo.image_url,
            raw_url: photo.raw_url,
            download: photo.download
          },
          credit: {
            source: photo.source,
            artist: photo.artist,
            artist_username: photo.artist_username,
            artist_link: photo.artist_link
          }
        }
      }
    }
  end
end
