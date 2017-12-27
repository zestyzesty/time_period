require "spec_helper"
require "time_period/fortnight"

class TimePeriod
  RSpec.describe Fortnight do
    let(:tue_dec26) { Date.new(2017, 12, 26) }
    let(:mon_dec25) { Date.new(2017, 12, 25) }

    it_behaves_like "TimePeriod"

    describe "::duration" do
      subject { described_class.duration }
      it { is_expected.to eq 2.week }
    end

    describe "#beginning" do
      it "is the monday of the week including the specified date" do
        expect(
          described_class.new(tue_dec26).beginning
        ).to eq mon_dec25
      end
    end
  end
end
