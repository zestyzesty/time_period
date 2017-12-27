require "spec_helper"
require "time_period/year"

class TimePeriod
  RSpec.describe Year do
    let(:dec26) { Date.new(2017, 12, 26) }
    let(:jan1) { Date.new(2017, 1, 1) }

    it_behaves_like "TimePeriod"

    describe "::duration" do
      subject { described_class.duration }
      it { is_expected.to eq 1.year }
    end

    describe "#beginning" do
      it "is the monday of the week including the specified date" do
        expect(
          described_class.new(dec26).beginning
        ).to eq jan1
      end
    end
  end
end
