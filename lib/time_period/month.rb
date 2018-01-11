require_relative "./base"

module TimePeriod
  class Month < Base
    DURATION = 1.month

    def initialize(beginning)
      super(beginning.to_date.beginning_of_month)
    end
  end
end
