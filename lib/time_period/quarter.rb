require_relative "./base"

module TimePeriod
  class Quarter < Base
    DURATION = 3.month

    def initialize(beginning)
      beginning = beginning.to_date

      # Q1 = 0, Q2 = 1, Q3 = 2, Q4 = 3
      quarter = (beginning.month - 1) / 3
      quarter_month = quarter * 3 + 1

      beginning_of_quarter = beginning.change(month: quarter_month, day: 1)

      super(beginning_of_quarter)
    end
  end
end
