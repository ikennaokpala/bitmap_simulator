class CreateImage
  def initialize(bitmap, arguments)
    @bitmap = bitmap
    @arguments = arguments.map(&:to_i)
  end

  def exec
    raise "row and/or columns have not been supplied" if incomplete?
    raise "out of bounds needs to be between 1 to 250" if invalid_coordinates?

    @bitmap.rows = @arguments.last
    @bitmap.columns = @arguments.first

    @bitmap.pixels
  end

private

  def incomplete?
    @arguments.size != 2
  end

  def invalid_coordinates?
    @arguments.all?{|argument| argument < 1 || argument > 250}
  end
end
