require "spec_helper"

describe InCompleteError do
  it "returns incomplete error message" do
    expect(subject.message).to(
      eq("InComplete Error: Row and/or columns have not been supplied")
    )
  end
end
