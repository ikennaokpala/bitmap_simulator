class DrawHorizontal < Base
  def exec
    super

    @bitmap.pixels.tap do |pixels|
      column_indices.each { |column_index| pixels[row_index][column_index] = colour }
    end
  end

private

  def row_index
    coordinates.last - 1
  end

  def positions
    @positions ||= coordinates.first(2).map{ |coordinate| coordinate - 1 }.sort
  end

  def column_indices
    @column_indices ||= (positions.first..positions.last).to_a
  end
end
