class MapFacade
  def self.get_location(location)
    json = MapService.get_location(location)
    Location.new(json)
  end

  def self.get_travel_time(to, from)
    json = MapService.get_travel_time(to, from)
    if json[:route][:routeError].present?
      json[:info][:messages].join
    else
      Travel.new(json, to, from)
    end
  end
end
