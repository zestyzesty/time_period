require "time_period"

class TimePeriod
  class Month < self
    DURATION = 1.month

    def initialize(beginning)
      super(beginning.to_date.beginning_of_month)
    end
  end
end
