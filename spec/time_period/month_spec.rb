require "spec_helper"
require "time_period/month"

module TimePeriod
  RSpec.describe Month do
    let(:dec26) { Date.new(2017, 12, 26) }
    let(:dec1) { Date.new(2017, 12, 1) }

    it_behaves_like "TimePeriod"

    describe "::duration" do
      subject { described_class.duration }
      it { is_expected.to eq 1.month }
    end

    describe "#beginning" do
      it "is the monday of the week including the specified date" do
        expect(
          described_class.new(dec26).beginning
        ).to eq dec1
      end
    end
  end
end
