require "spec_helper"
require "time_period/rolling_quarter"

class TimePeriod
  RSpec.describe RollingQuarter do
    it_behaves_like "TimePeriod"
    it_behaves_like "rolling TimePeriod"

    describe "::duration" do
      subject { described_class.duration }
      it { is_expected.to eq 3.month }
    end
  end
end
