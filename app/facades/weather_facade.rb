class WeatherFacade

  def self.get_weather(lat, long)
    json = WeatherService.get_weather(lat, long)
    Forecast.new(json, "partial")
  end

  def self.get_full_weather(lat, long)
    json = WeatherService.get_weather(lat, long)
    Forecast.new(json, "full")
  end

end
