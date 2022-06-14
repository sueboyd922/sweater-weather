class Travel
  attr_reader :time_in_days, :time_in_hours, :time_in_string, :origin, :destination

  def initialize(data, to, from)
    @time_in_string = ActiveSupport::Duration.build(data[:route][:realTime]).inspect
    @time_in_hours = (data[:route][:realTime] / 3600.0).round
    @time_in_days = (data[:route][:realTime] / 86400).round
    @origin = from
    @destination = to
  end

  def over_two_days?
    @time_in_hours > 48
  end

end
