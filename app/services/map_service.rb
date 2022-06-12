class MapService

  def self.get_location(location)
    response = conn.get("/geocoding/v1/address?key=#{ENV['map_api']}&location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new("http://www.mapquestapi.com")
  end
end
