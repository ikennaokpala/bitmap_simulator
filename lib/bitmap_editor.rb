require "parser"
require "bitmap"
require "incomplete_error"
require "invalid_coordinates_error"
require "base"
require "create_image"
require "colour_pixel"
require "clear_table"
require "draw_vertical"
require "draw_horizontal"

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if unavailable_file?(file)

    File.open(file).each_with_object(Bitmap.new) do |line, bitmap|
      directive = Parser.new(line.chomp)
      case directive.command
      when "I"
        CreateImage.new(bitmap, directive.coordinates_colours).exec
      when "C"
        ClearTable.new(bitmap).exec
      when "L"
        ColourPixel.new(bitmap, directive.coordinates_colours).exec
      when "V"
        DrawVertical.new(bitmap, directive.coordinates_colours).exec
      when "H"
        DrawHorizontal.new(bitmap, directive.coordinates_colours).exec
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
