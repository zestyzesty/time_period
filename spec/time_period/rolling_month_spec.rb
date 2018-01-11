require "spec_helper"
require "time_period/rolling_month"

module TimePeriod
  RSpec.describe RollingMonth do
    it_behaves_like "TimePeriod"
    it_behaves_like "rolling TimePeriod"

    describe "::duration" do
      subject { described_class.duration }
      it { is_expected.to eq 1.month }
    end
  end
end
