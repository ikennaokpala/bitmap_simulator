class ColourPixel
  def initialize(bitmap, coordinates_colours)
    @bitmap = bitmap
    @coordinates_colours = coordinates_colours
  end

  def exec
    raise "row and/or columns have not been supplied" if incomplete?
    raise "out of bounds needs to be between 1 to 250" if invalid_coordinates?

    @bitmap.pixels.tap do |pixels|
      pixels[positions.last][positions.first] = colour
    end
  end

private

  def colour
    @colour ||= (colours.first || "")
  end

  def colours
    @colours ||= @coordinates_colours.fetch(:colours)
  end

  def coordinates
    @coordinates ||= @coordinates_colours.fetch(:coordinates).map(&:to_i)
  end

  def positions
    @positions ||= coordinates.map{ |coordinate| coordinate - 1 }
  end

  def incomplete?
    coordinates.size != 2 && colours.size != 1
  end

  def invalid_coordinates?
    coordinates.all?{ |coordinate| coordinate < 1 || coordinate > 250 }
  end
end
