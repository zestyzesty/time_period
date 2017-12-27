require "time_period"

class TimePeriod
  class Fortnight < self
    DURATION = 2.week

    def initialize(beginning)
      super(beginning.to_date.beginning_of_week)
    end
  end
end
