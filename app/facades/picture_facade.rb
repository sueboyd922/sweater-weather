class PictureFacade

  def self.get_photo(search)
    json = PictureService.get_photo(search)
    Picture.new(json, search)
  end
end
