require "spec_helper"

describe ClearTable do
  describe "#exec" do
    it "clears each pixel on the pixels table back to white (O)" do
      allow_any_instance_of(Bitmap).to receive(:pixels).and_return([["A", "O"], ["O", "A"]])
      clear_table = described_class.new(Bitmap.new(2, 2))

      expect(clear_table.exec).to match_array([["O", "O"], ["O", "O"]])
    end
  end
end
