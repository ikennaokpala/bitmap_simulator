require "spec_helper"

describe DrawVertical do
  describe "#exec" do
    it "returns a new pixel array if arguments are valid" do
      draw_vertical = described_class.new(Bitmap.new(2, 3), ["2", "1", "2", "W"])
      expected = [["O", "W", "O"], ["O", "W", "O"]]

      expect(draw_vertical.exec).to match_array(expected)
    end

    it "raises out of bounds exception if arguments are invalid" do
      expect{ described_class.new(Bitmap.new(2, 3), ["0", "0", "251", "A"]).exec }.to(
        raise_error(/out of bounds needs to be between 1 to 250/)
      )
    end

    it "raises incomplete exception if arguments are empty" do
      expect{ described_class.new(Bitmap.new(2, 3), []).exec }.to(
        raise_error(/row and\/or columns have not been supplied/)
      )
    end

    it "raises incomplete exception if arguments contain only numerals" do
      expect{ described_class.new(Bitmap.new(2, 3), [1, 2, 3, 4]).exec }.to(
        raise_error(/row and\/or columns have not been supplied/)
      )
    end

    it "raises incomplete exception if arguments contain only alphabets" do
      expect{ described_class.new(Bitmap.new(2, 3), ["A", "B", "C", "D"]).exec }.to(
        raise_error(/row and\/or columns have not been supplied/)
      )
    end
  end
end
