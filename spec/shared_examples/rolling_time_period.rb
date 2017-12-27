RSpec.shared_examples "rolling TimePeriod" do
  describe "#beginning" do
    it "is the date specified at initialization" do
      dec26 = Date.new(2017, 12, 26)

      expect(
        described_class.new(dec26).beginning
      ).to eq dec26
    end
  end
end
