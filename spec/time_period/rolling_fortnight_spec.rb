require "spec_helper"
require "time_period/rolling_fortnight"

class TimePeriod
  RSpec.describe RollingFortnight do
    it_behaves_like "TimePeriod"
    it_behaves_like "rolling TimePeriod"

    describe "::duration" do
      subject { described_class.duration }
      it { is_expected.to eq 2.week }
    end
  end
end
