require "spec_helper"

describe ColourPixel do
  describe "#exec" do
    it "returns array with a coloured pixel as expected" do
      expected = [["O", "O", "O", "O"], ["O", "A", "O", "O"], ["O", "O", "O", "O"], ["O", "O", "O", "O"]]
      colour_pixel = described_class.new(Bitmap.new(4, 4), ["2", "2", "A"])

      expect(colour_pixel.exec).to match_array(expected)
    end

    it "raises out of bounds exception if arguments are invalid" do
      colour_pixel = described_class.new(Bitmap.new(4, 4), ["0", "251", "A"])

      expect{ colour_pixel.exec }.to(
        raise_error(/out of bounds needs to be between 1 to 250/)
      )
    end

    it "raises incomplete exception if arguments are empty" do
      expect{ described_class.new(Bitmap.new(4, 4), []).exec }.to(
        raise_error(/row and\/or columns have not been supplied/)
      )
    end

    it "raises incomplete exception if arguments contain only numerals" do
      expect{ described_class.new(Bitmap.new(4, 4), [1, 2, 3]).exec }.to(
        raise_error(/row and\/or columns have not been supplied/)
      )
    end

    it "raises incomplete exception if arguments contain only alphabets" do
      expect{ described_class.new(Bitmap.new(4, 4), ["A", "B", "C"]).exec }.to(
        raise_error(/row and\/or columns have not been supplied/)
      )
    end
  end
end
