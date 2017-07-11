class BitmapEditor

  def run(file)
    return puts "please provide correct file" if unavailable_file?(file)

    File.open(file).each do |line|
      line = line.chomp
      case line
      when "S"
        puts "There is no image"
      else
        puts "unrecognised command :("
      end
    end
  end

private

  def unavailable_file?(file)
    file.nil? || !File.exists?(file)
  end
end
