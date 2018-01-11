require "spec_helper"
require "time_period/quarter"

module TimePeriod
  RSpec.describe Quarter do
    it_behaves_like "TimePeriod"

    let(:oct1) { Date.new(2017, 10, 1) }

    describe "::duration" do
      subject { described_class.duration }
      it { is_expected.to eq 3.month }
    end

    describe "#beginning" do
      it "is the nearest preceding start of a quarter" do
        dec26 = Date.new(2017, 12, 26)
        quarter4 = described_class.new(dec26)

        expect(quarter4.beginning).to eq oct1
      end
    end
  end
end
