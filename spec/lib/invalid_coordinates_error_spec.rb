require "spec_helper"

describe InvalidCoordinatesError do
  it "returns incomplete error message" do
    expect(subject.message).to(
      eq("InvalidCoordinates Error: Out of bounds needs to be between 1 to 250")
    )
  end
end
