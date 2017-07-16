require "spec_helper"

describe DrawHorizontal do
  describe "#exec" do
    it "returns a new pixel array if arguments are valid" do
      coordinates_colours = { coordinates: ["2", "1", "2"], colours: ["Z"] }
      draw_vertical = described_class.new(Bitmap.new(2, 3), coordinates_colours)
      expected = [["O", "O", "O"], ["Z", "Z", "O"]]

      expect(draw_vertical.exec).to match_array(expected)
    end

    it "raises out of bounds exception if arguments are invalid" do
      coordinates_colours = { coordinates: ["0", "0", "251"], colours: ["A"] }
      expect{ described_class.new(Bitmap.new(2, 3), coordinates_colours).exec }.to(
        raise_error(
          InvalidCoordinatesError,
          /InvalidCoordinates Error: Out of bounds needs to be between 1 to 250/
        )
      )
    end

    it "raises incomplete exception if arguments are empty" do
      coordinates_colours = { coordinates: [], colours: [] }
      expect{ described_class.new(Bitmap.new(2, 3), coordinates_colours).exec }.to(
        raise_error(
          InCompleteError,
          /InComplete Error: Row and\/or columns have not been supplied/
        )
      )
    end

    it "raises incomplete exception if arguments contain only numerals" do
      coordinates_colours = { coordinates: [1, 2, 3, 4], colours: [] }
      expect{ described_class.new(Bitmap.new(2, 3), coordinates_colours).exec }.to(
        raise_error(
          InCompleteError,
          /InComplete Error: Row and\/or columns have not been supplied/
        )
      )
    end

    it "raises incomplete exception if arguments contain only alphabets" do
      coordinates_colours = { coordinates: [], colours: ["A", "B", "C", "D"] }
      expect{ described_class.new(Bitmap.new(2, 3), coordinates_colours).exec }.to(
        raise_error(
          InCompleteError,
          /InComplete Error: Row and\/or columns have not been supplied/
        )
      )
    end
  end
end
