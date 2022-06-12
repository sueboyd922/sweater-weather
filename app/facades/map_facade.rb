class MapFacade
  def self.get_location(location)
    json = MapService.get_location(location)
    Location.new(json)
  end
end
