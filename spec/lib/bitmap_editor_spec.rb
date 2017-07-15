require 'spec_helper'

describe BitmapEditor do
  describe "#run" do
    let(:no_file_path) { nil }
    let(:unavailable_file_path) { fixtures_file_path("unavailable.txt") }
    let(:empty_file_path) { fixtures_file_path("empty.txt") }
    let(:s_file_path) { fixtures_file_path("s.txt") }
    let(:i_file_path) { fixtures_file_path("i.txt") }
    let(:c_file_path) { fixtures_file_path("c.txt") }
    let(:l_file_path) { fixtures_file_path("l.txt") }
    let(:v_file_path) { fixtures_file_path("v.txt") }
    let(:h_file_path) { fixtures_file_path("h.txt") }
    let(:arbitrary_file_path) { fixtures_file_path("arbitrary.txt") }

    context "when commands file does not exists" do
      it "returns incorrect output message if no file path is defined" do
        expect { subject.run(no_file_path) }.to(
          output(/please provide correct file/).to_stdout
        )
      end

      it "returns incorrect output message if unavailable file path is defined" do
        expect { subject.run(unavailable_file_path) }.to(
          output(/please provide correct file/).to_stdout
        )
      end
    end

    context "when commands file exists" do
      it "returns empty output if empty file is supplied" do
        expect { subject.run(empty_file_path) }.to output("").to_stdout
      end

      it "creates a new M x N image coloured white (O) with 'I 2 2' directive" do
        expect { subject.run(i_file_path) }.to(
          output(/OO\nOO\n/).to_stdout
        )
      end

      it "clears pixel table setting each pixel colour to white (O) with 'C' directive" do
        expect { subject.run(c_file_path) }.to(
          output(/OOOO\nOOOO\nOOOO\nOOOO\n/).to_stdout
        )
      end

      it "colours the pixel (X,Y) with colour C. 'L 2 2 A' directive" do
        expect { subject.run(l_file_path) }.to(
          output(/OOOO\nOAOO\nOOOO\nOOOO\n/).to_stdout
        )
      end

      it "draws a vertical segment of colour C. 'V 2 1 2 W' directive" do
        expect { subject.run(v_file_path) }.to(
          output(/OWO\nOWO\n/).to_stdout
        )
      end

      it "draws a vertical segment of colour C. 'H 2 1 2 Z' directive" do
        expect { subject.run(h_file_path) }.to(
          output(/OOO\nZZO\n/).to_stdout
        )
      end

      it "returns image output if file with only 'S' command is supplied" do
        allow_any_instance_of(Bitmap).to receive(:rows).and_return(2)
        allow_any_instance_of(Bitmap).to receive(:columns).and_return(2)

        expect { subject.run(s_file_path) }.to(
          output(/OO\nOO\n/).to_stdout
        )
      end

      it "returns unrecognised output if file with an unrecognised command is supplied" do
        expect { subject.run(arbitrary_file_path) }.to(
          output(/unrecognised command :\(/).to_stdout
        )
      end
    end
  end
end
