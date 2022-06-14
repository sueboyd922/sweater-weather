class RoadTripSerializer

  def self.new_trip(travel, weather)
    {
      data: {
        id: "null",
        type: "roadtrip",
        attributes: {
          start_city: travel.origin,
          end_city: travel.destination,
          travel_time: travel.time_in_string,
          weather_at_eta:
            if travel.over_two_days?
              {
                temperature: weather.daily_weather[travel.time_in_days].max_temp,              conditions: weather.daily_weather[travel.time_in_days].conditions
              }
            else
              {
                temperature: weather.hourly_weather[travel.time_in_hours].temp,
                conditions: weather.hourly_weather[travel.time_in_hours].conditions
              }
            end

        }
      }
    }
  end
end
