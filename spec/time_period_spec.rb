require "spec_helper"

RSpec.describe TimePeriod do
  class DumbTimePeriod < described_class
    DURATION = 2.months
  end

  class DumberTimePeriod < described_class
    DURATION = 3.week
  end

  let(:dec_26_2017) { Date.new(2017, 12, 26) }
  let(:feb_26_2018) { Date.new(2018, 2, 26) }
  let(:apr_26_2018) { Date.new(2018, 4, 26) }

  let(:dec_tp) { DumbTimePeriod.new(dec_26_2017) }
  let(:feb_tp) { DumbTimePeriod.new(feb_26_2018) }
  let(:apr_tp) { DumbTimePeriod.new(apr_26_2018) }

  it "has a version number" do
    expect(TimePeriod::VERSION).not_to be_nil
  end

  describe "::duration" do
    it "returns the duration defined in the subclass" do
      expect(DumbTimePeriod.duration).to eq 2.months
    end
  end

  describe "::this" do
    it "initializes a time_period with the current TimeWithZone" do
      Timecop.freeze(dec_26_2017) do
        expect(
          DumbTimePeriod.this
        ).to eq dec_tp
      end
    end

    it "accepts an alternate parameter" do
      Timecop.freeze(dec_26_2017) do
        expect(
          DumbTimePeriod.this(now: feb_26_2018)
        ).to eq feb_tp
      end
    end
  end

  describe "::relative" do
    it "goes forward n durations' worth of time" do
      Timecop.freeze(dec_26_2017) do
        expect(
          DumbTimePeriod.relative(2)
        ).to eq apr_tp
      end
    end

    it "goes backward n durations' worth of time" do
      Timecop.freeze(apr_26_2018) do
        expect(
          DumbTimePeriod.relative(-2)
        ).to eq dec_tp
      end
    end
  end

  describe "::next" do
    it "is relative +1" do
      Timecop.freeze(feb_26_2018) do
        expect(DumbTimePeriod.next).to eq apr_tp
      end
    end
  end

  describe "::last" do
    it "is relative -1" do
      Timecop.freeze(apr_26_2018) do
        expect(DumbTimePeriod.last).to eq feb_tp
      end
    end
  end

  describe "#eql?" do
    specify "it depends on class and beginning" do
      other_dumb_dec_tp = DumbTimePeriod.new(dec_26_2017)
      dumber_dec_tp = DumberTimePeriod.new(dec_26_2017)

      expect(dec_tp).to eq other_dumb_dec_tp
      expect(dec_tp).not_to eq dumber_dec_tp
      expect(dec_tp).not_to eq feb_tp
    end
  end

  describe "#beginning" do
    it "is the date with which the class was initialized" do
      expect(
        DumbTimePeriod.new(dec_26_2017).beginning
      ).to eq dec_26_2017
    end
  end

  describe "#ending" do
    it "is the beginning plus the duration" do
      expect(
        DumbTimePeriod.new(dec_26_2017).ending
      ).to eq feb_26_2018
    end
  end
end
