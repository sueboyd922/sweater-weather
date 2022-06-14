class MapService < BaseService

  def self.get_location(location)
    response = connection.get("/geocoding/v1/address?key=#{ENV['map_api']}&location=#{location}")
    get_json(response)
  end

  def self.get_travel_time(to, from)
    response = connection.get("/directions/v2/route?key=#{ENV['map_api']}&from=#{from}&to=#{to}")
    get_json(response)
  end

  def self.connection
    conn("http://www.mapquestapi.com")
  end
end
