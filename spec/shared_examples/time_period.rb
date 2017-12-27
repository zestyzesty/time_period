RSpec.shared_examples "TimePeriod" do
  class DumbTimePeriod < TimePeriod
    DURATION = 3.seconds
  end

  let(:minus_two_date) { (described_class::DURATION * -2).ago(origin_date) }
  let(:minus_one_date) { described_class::DURATION.ago(origin_date) }
  let(:origin_date) { Date.new(2017) }
  let(:plus_one_date) { described_class::DURATION.since(origin_date) }
  let(:plus_two_date) { (described_class::DURATION * 2).since(origin_date) }

  let(:minus_two_tp) { described_class.new(minus_two_date) }
  let(:minus_one_tp) { described_class.new(minus_one_date) }
  let(:origin_tp) { described_class.new(origin_date) }
  let(:plus_one_tp) { described_class.new(plus_one_date) }
  let(:plus_two_tp) { described_class.new(plus_two_date) }

  describe "::duration" do
    it "returns the duration defined as a constant in the subclass" do
      expect(described_class.duration).to eq described_class::DURATION
    end
  end

  describe "::this" do
    it "initializes a time_period with the current TimeWithZone" do
      Timecop.freeze(origin_date) do
        expect(described_class.this).to eq origin_tp
      end
    end

    it "accepts an alternate parameter" do
      Timecop.freeze(origin_date) do
        expect(
          described_class.this(now: plus_one_date)
        ).to eq plus_one_tp
      end
    end
  end

  describe "::relative" do
    it "goes forward n durations' worth of time" do
      Timecop.freeze(origin_date) do
        expect(
          described_class.relative(2)
        ).to eq plus_two_tp
      end
    end

    it "goes backward n durations' worth of time" do
      Timecop.freeze(plus_two_date) do
        expect(
          described_class.relative(-2)
        ).to eq origin_tp
      end
    end
  end

  describe "::next" do
    it "is relative +1" do
      Timecop.freeze(origin_date) do
        expect(described_class.next).to eq plus_one_tp
      end
    end
  end

  describe "::last" do
    it "is relative -1" do
      Timecop.freeze(origin_date) do
        expect(described_class.last).to eq minus_one_tp
      end
    end
  end

  describe "#ending" do
    it "is the beginning plus the duration" do
      time_period = described_class.new(Date.new(2017, 12, 26))

      expect(
        time_period.ending
      ).to eq time_period.beginning + described_class.duration
    end
  end

  describe "#eql?" do
    specify "it depends on class and beginning" do
      dumb_origin_tp = DumbTimePeriod.new(origin_date)
      other_origin_tp = described_class.new(origin_date)

      expect(origin_tp).to eq other_origin_tp
      expect(origin_tp).not_to eq dumb_origin_tp
      expect(origin_tp).not_to eq plus_one_tp
    end
  end
end
