require_relative "./base"

module TimePeriod
  class RollingQuarter < Base
    DURATION = 3.month
  end
end
