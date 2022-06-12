class Forecast

  def initialize(data)
    @current_weather = CurrentWeather.new(data[:current])
    @daily_weather = set_daily_weather(data[:daily])
    @hourly_weather = set_hourly_weather(data[:hourly][0..7])
  end

  def set_daily_weather(days)
    days.map {|day| DailyWeather.new(day)}
  end

  def set_hourly_weather(hours)
    hours.map {|hour| HourlyWeather.new(hour)}
  end
end
