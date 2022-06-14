class MapFacade
  def self.get_location(location)
    json = MapService.get_location(location)
    Location.new(json)
  end

  def self.get_travel_time(to, from)
    json = MapService.get_travel_time(to, from)
    Travel.new(json)
  end
end
