require "time_period"

class TimePeriod
  class Week < self
    DURATION = 1.week

    def initialize(beginning)
      super(beginning.to_date.beginning_of_week)
    end
  end
end
