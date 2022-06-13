class WeatherService < BaseService

  def self.get_weather(lat, long)
    response = connection.get("/data/2.5/onecall?lat=#{lat}&lon=#{long}&units=imperial&exclude=minutely&appid=#{ENV['weather_api']}")
    get_json(response)
  end

  def self.connection
    conn("https://api.openweathermap.org")
  end
end
