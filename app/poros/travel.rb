class Travel

  def initialize(data)
    @time_in_string = ActiveSupport::Duration.build(data[:route][:realTime])
    @time_in_hours = (data[:route][:realTime] / 3600.0).round
    @time_in_days = (data[:route][:realTime] / 86400).round
  end

  def over_two_days?
    @time_in_hours > 48
  end

end
