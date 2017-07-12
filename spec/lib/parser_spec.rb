require 'spec_helper'

describe Parser do
  subject { Parser.new("I 3 2") }

  describe "#fragments" do
    it "generates two elements array" do
      expect(subject.fragments.count).to equal(2)
    end

    it "generates an array only once" do
      expect_any_instance_of(String).to receive(:split).once.and_return([1])

      subject.fragments
      subject.fragments
    end
  end

  describe "#command" do
    it "returns one character command" do
      expect(subject.command.length).to equal(1)
    end

    it "returns valid command" do
      expect(subject.command).to eq("I")
    end
  end

  describe "#arguments" do
    it "returns valid arguments" do
      expect(subject.arguments).to match_array(["3", "2"])
    end

    it "returns characters that make up the commands parameters" do
      expect(subject.arguments.length).to equal(2)
    end
  end
end
