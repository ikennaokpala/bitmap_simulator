require "matrix"

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if unavailable_file?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when "S"
        puts bitmap_image
      else
        puts "unrecognised command :("
      end
    end
  end

private

  def unavailable_file?(file)
    file.nil? || !File.exists?(file)
  end

  def bitmap_image(rows = 6, columns = 5)
    pixels = Matrix.build(rows, columns){ "W" }.to_a
    pixels.inject(nil) { |compiler, row| compiler = "#{compiler}#{row.join}\n" }
  end
end
