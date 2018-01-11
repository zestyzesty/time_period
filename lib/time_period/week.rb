require_relative "./base"

module TimePeriod
  class Week < Base
    DURATION = 1.week

    def initialize(beginning)
      super(beginning.to_date.beginning_of_week)
    end
  end
end
