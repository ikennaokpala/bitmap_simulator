require "spec_helper"

describe CreateImage do
  describe "#exec" do
    it "returns a new pixel array if arguments are valid" do
      allow_any_instance_of(Bitmap).to receive(:rows).and_return(2)
      allow_any_instance_of(Bitmap).to receive(:columns).and_return(2)
      coordinates_colours = { coordinates: ["2", "2"], colours: [] }
      create_image = described_class.new(Bitmap.new, coordinates_colours)

      expect(create_image.exec).to match_array([["O", "O"], ["O", "O"]])
    end

    it "raises out of bounds exception if arguments are invalid" do
      coordinates_colours = { coordinates: [0, 251], colours: [] }
      create_image = described_class.new(Bitmap.new, coordinates_colours)

      expect{ create_image.exec }.to(
        raise_error(/out of bounds needs to be between 1 to 250/)
      )
    end

    it "raises incomplete exception if arguments size is not equal to 2" do
      coordinates_colours = { coordinates: [1], colours: [] }
      create_image = described_class.new(Bitmap.new, coordinates_colours)

      expect{ create_image.exec }.to(
        raise_error(/row and\/or columns have not been supplied/)
      )
    end
  end
end
