class ColourPixel
  def initialize(bitmap, arguments)
    @bitmap = bitmap
    @arguments = arguments
  end

  def exec
    raise "row and/or columns have not been supplied" if incomplete?
    raise "out of bounds needs to be between 1 to 250" if invalid_coordinates?

    @bitmap.pixels.tap do |pixels|
      pixels[positions.last][positions.first] = colour
    end
  end

private

  def coordinates_colour
    @coordinates_colour ||= Hash[[:coordinates, :colours].zip(
      @arguments.partition { |arg| arg !~ /[A-Za-z]/ }
    )]
  end

  def colour
    @colour ||= (colours.first || "")
  end

  def colours
    @colours ||= coordinates_colour.fetch(:colours)
  end

  def coordinates
    @coordinates ||= coordinates_colour.fetch(:coordinates).map(&:to_i)
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
