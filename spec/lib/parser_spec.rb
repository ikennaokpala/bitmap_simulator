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

  describe "#coordinates_colours" do
    context "for commands without colouring directive" do
      it "returns valid coordinates and empty colours" do
        expected = {coordinates: ["3", "2"], colours: [] }
        expect(subject.coordinates_colours).to match_array(expected)
      end

      it "returns characters that make up the commands parameters" do
        expect(subject.coordinates_colours.fetch(:coordinates).length).to equal(2)
        expect(subject.coordinates_colours.fetch(:colours).length).to equal(0)
      end
    end

    context "for commands with colouring directive" do
      subject { Parser.new("L 3 2 A") }

      it "returns valid coordinates and colours" do
        expected = {coordinates: ["3", "2"], colours: ["A"] }
        expect(subject.coordinates_colours).to match_array(expected)
      end

      it "returns characters that make up the commands parameters" do
        expect(subject.coordinates_colours.fetch(:coordinates).length).to equal(2)
        expect(subject.coordinates_colours.fetch(:colours).length).to equal(1)
      end
    end

    it "generates coordinates and colours hash only once" do
      expect(Hash).to receive(:[]).once.and_return({})

      subject.coordinates_colours
      subject.coordinates_colours
    end
  end
end
