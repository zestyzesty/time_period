require "time_period"

class TimePeriod
  class Year < self
    DURATION = 1.year

    def initialize(beginning)
      super(beginning.to_date.beginning_of_year)
    end
  end
end
