class CreateImage
  def initialize(bitmap, coordinates_colours)
    @bitmap = bitmap
    @coordinates_colours = coordinates_colours
  end

  def exec
    raise "row and/or columns have not been supplied" if incomplete?
    raise "out of bounds needs to be between 1 to 250" if invalid_coordinates?

    @bitmap.rows = coordinates.last
    @bitmap.columns = coordinates.first

    @bitmap.pixels
  end

private

  def coordinates
    @coordinates_colours.fetch(:coordinates).map(&:to_i)
  end

  def incomplete?
    coordinates.size != 2
  end

  def invalid_coordinates?
    coordinates.all?{|coordinate| coordinate < 1 || coordinate > 250}
  end
end
