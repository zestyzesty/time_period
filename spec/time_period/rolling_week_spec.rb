require "spec_helper"
require "time_period/rolling_week"

class TimePeriod
  RSpec.describe RollingWeek do
    it_behaves_like "TimePeriod"
    it_behaves_like "rolling TimePeriod"

    describe "::duration" do
      subject { described_class.duration }
      it { is_expected.to eq 1.week }
    end
  end
end
