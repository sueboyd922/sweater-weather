class ForecastSerializer

  def self.new_forecast(data)
    {
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: {
            datetime: data.current_weather.date_time,
            temperature: data.current_weather.temp,
            feels_like: data.current_weather.feels_like,
            humidity: data.current_weather.humidity,
            uvi: data.current_weather.visibility,
            sunrise: data.current_weather.sunrise,
            sunset: data.current_weather.sunset,
            conditions: data.current_weather.conditions,
            icon: data.current_weather.icon
          },
          daily_weather: data.daily_weather.map do |weather|
              {
                date: weather.date,
                max_temp: weather.max_temp,
                min_temp: weather.min_temp,
                sunrise: weather.sunrise,
                sunset: weather.sunset,
                conditions: weather.conditions,
                icon: weather.icon
              }
            end,
          hourly_weather: data.hourly_weather.map do |weather|
              {
                time: weather.time,
                temperature: weather.temp,
                conditions: weather.conditions,
                icon: weather.icon
              }
            end
        }
      }
    }
  end
end
