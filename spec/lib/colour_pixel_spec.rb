require "spec_helper"

describe ColourPixel do
  describe "#exec" do
    it "returns array with a coloured pixel as expected" do
      coordinates_colours = { coordinates: ["2", "2"], colours: ["A"] }
      expected = [["O", "O", "O", "O"], ["O", "A", "O", "O"], ["O", "O", "O", "O"], ["O", "O", "O", "O"]]
      colour_pixel = described_class.new(Bitmap.new(4, 4), coordinates_colours)

      expect(colour_pixel.exec).to match_array(expected)
    end

    it "raises out of bounds exception if arguments are invalid" do
      coordinates_colours = { coordinates: ["0", "251"], colours: ["A"] }
      colour_pixel = described_class.new(Bitmap.new(4, 4), coordinates_colours)

      expect{ colour_pixel.exec }.to(
        raise_error(/out of bounds needs to be between 1 to 250/)
      )
    end

    it "raises incomplete exception if arguments are empty" do
      coordinates_colours = { coordinates: [], colours: [] }
      expect{ described_class.new(Bitmap.new(4, 4), coordinates_colours).exec }.to(
        raise_error(/row and\/or columns have not been supplied/)
      )
    end

    it "raises incomplete exception if arguments contain only numerals" do
      coordinates_colours = { coordinates: [1, 2, 3], colours: [] }
      expect{ described_class.new(Bitmap.new(4, 4), coordinates_colours).exec }.to(
        raise_error(/row and\/or columns have not been supplied/)
      )
    end

    it "raises incomplete exception if arguments contain only alphabets" do
      coordinates_colours = { coordinates: [], colours: ["A", "B", "C"] }
      expect{ described_class.new(Bitmap.new(4, 4), coordinates_colours).exec }.to(
        raise_error(/row and\/or columns have not been supplied/)
      )
    end
  end
end
