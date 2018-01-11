require_relative "./base"

module TimePeriod
  class Year < Base
    DURATION = 1.year

    def initialize(beginning)
      super(beginning.to_date.beginning_of_year)
    end
  end
end
