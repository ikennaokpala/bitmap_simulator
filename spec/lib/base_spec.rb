require "spec_helper"

describe Base do
  describe "#exec" do
    it "returns nil with valid coordinates_colours supplied" do
      coordinates_colours = { coordinates: ["2", "2"], colours: ["A"] }
      colour_pixel = described_class.new(Bitmap.new(4, 4), coordinates_colours)

      expect(colour_pixel.exec).to eq(nil)
    end

    it "raises out of bounds exception if arguments are invalid" do
      coordinates_colours = { coordinates: ["0", "251"], colours: ["A"] }
      colour_pixel = described_class.new(Bitmap.new(4, 4), coordinates_colours)

      expect{ colour_pixel.exec }.to(
        raise_error(
          InvalidCoordinatesError,
          /InvalidCoordinates Error: Out of bounds needs to be between 1 to 250/
        )
      )
    end

    it "raises incomplete exception if arguments are empty" do
      coordinates_colours = { coordinates: [], colours: [] }
      expect{ described_class.new(Bitmap.new(4, 4), coordinates_colours).exec }.to(
        raise_error(
          InCompleteError,
          /Row and\/or columns have not been supplied/
        )
      )
    end

    it "raises incomplete exception if arguments contain only numerals" do
      coordinates_colours = { coordinates: [1, 2, 3], colours: [] }
      expect{ described_class.new(Bitmap.new(4, 4), coordinates_colours).exec }.to(
        raise_error(
          InCompleteError,
          /Row and\/or columns have not been supplied/
        )
      )
    end

    it "raises incomplete exception if arguments contain only alphabets" do
      coordinates_colours = { coordinates: [], colours: ["A", "B", "C"] }
      expect{ described_class.new(Bitmap.new(4, 4), coordinates_colours).exec }.to(
        raise_error(
          InCompleteError,
          /Row and\/or columns have not been supplied/
        )
      )
    end
  end
end
