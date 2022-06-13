class MapService < BaseService

  def self.get_location(location)
    response = connection.get("/geocoding/v1/address?key=#{ENV['map_api']}&location=#{location}")
    get_json(response)
  end

  def self.connection
    conn("http://www.mapquestapi.com")
  end
end
