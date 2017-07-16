class Base
  def initialize(bitmap, coordinates_colours)
    @bitmap = bitmap
    @coordinates_colours = coordinates_colours
  end

  def exec
    raise InCompleteError if incomplete?
    raise InvalidCoordinatesError if invalid_coordinates?
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
    (coordinates.size != 2 || coordinates.size != 3) && colours.size != 1
  end

  def invalid_coordinates?
    coordinates.all?{ |coordinate| coordinate < 1 || coordinate > 250 }
  end
end
