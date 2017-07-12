require_relative "./parser"
require_relative "./bitmap"

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if unavailable_file?(file)

    File.open(file).each do |line|
      directive = Parser.new(line.chomp)
      case directive.command
      when "S"
        puts Bitmap.new.image
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
