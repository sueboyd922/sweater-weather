class Travel
  attr_reader :time_in_days, :time_in_hours, :time_in_string, :origin, :destination

  def initialize(data, to, from)
    if data[:route][:legs].present?
      @time_in_string = ActiveSupport::Duration.build(data[:route][:legs][0][:time]).inspect
      @time_in_hours = (data[:route][:legs][0][:time] / 3600.0).round
      @time_in_days = (data[:route][:legs][0][:time] / 86400).round
    else
      @time_in_string = "Impossible route"
    end
    @origin = from
    @destination = to
  end

  def over_two_days?
    @time_in_hours > 47
  end
end
