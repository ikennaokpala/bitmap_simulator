require_relative "./parser"
require_relative "./bitmap"
require_relative "./create_image"

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if unavailable_file?(file)

    bitmap = Bitmap.new
    File.open(file).each do |line|
      directive = Parser.new(line.chomp)
      case directive.command
      when "I"
        CreateImage.new(bitmap, directive.arguments).exec
      when "S"
        puts bitmap.image
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
