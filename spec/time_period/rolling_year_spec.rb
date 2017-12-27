require "spec_helper"
require "time_period/rolling_year"

class TimePeriod
  RSpec.describe RollingYear do
    it_behaves_like "TimePeriod"
    it_behaves_like "rolling TimePeriod"

    describe "::duration" do
      subject { described_class.duration }
      it { is_expected.to eq 1.year }
    end
  end
end
