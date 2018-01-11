require "time_period/day"
require "spec_helper"

module TimePeriod
  RSpec.describe Day do
    it_behaves_like "TimePeriod"
    it_behaves_like "rolling TimePeriod"

    describe "::duration" do
      it { expect(described_class.duration).to eq 1.day }
    end
  end
end
