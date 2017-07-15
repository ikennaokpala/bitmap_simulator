require_relative "./parser"
require_relative "./bitmap"
require_relative "./create_image"
require_relative "./colour_pixel"
require_relative "./clear_table"
require_relative "./draw_vertical"
require_relative "./draw_horizontal"

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if unavailable_file?(file)

    File.open(file).each_with_object(Bitmap.new) do |line, bitmap|
      directive = Parser.new(line.chomp)
      case directive.command
      when "I"
        CreateImage.new(bitmap, directive.arguments).exec
      when "C"
        ClearTable.new(bitmap).exec
      when "L"
        ColourPixel.new(bitmap, directive.arguments).exec
      when "V"
        DrawVertical.new(bitmap, directive.arguments).exec
      when "H"
        DrawHorizontal.new(bitmap, directive.arguments).exec
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
