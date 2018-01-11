require_relative "./base"

module TimePeriod
  class Fortnight < Base
    DURATION = 2.week

    def initialize(beginning)
      super(beginning.to_date.beginning_of_week)
    end
  end
end
