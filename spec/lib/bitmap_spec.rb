require "spec_helper"

describe Bitmap do
  describe "#pixels" do
    context "when rows and columns are set with numerical values" do
      before do
        subject.rows = 2
        subject.columns = 2
      end

      it "creates multi-dimension array based on the rows and columns supplied" do
        expect(subject.pixels).to match_array([["O", "O"], ["O", "O"]])
      end

      it "builds a matrix only once before converting it to an array" do
        expect(Matrix).to receive(:build).once.and_return([])

        subject.pixels
        subject.pixels
      end
    end

    context "when rows and columns are not defined" do
      it "creates an empty array" do
        expect(subject.pixels).to match_array([])
      end
    end
  end

  describe "#image" do
    it "compiles pixel array to string" do
      subject.rows = 2
      subject.columns = 2

      expect(subject.image).to eq("OO\nOO\n")
    end
  end
end
