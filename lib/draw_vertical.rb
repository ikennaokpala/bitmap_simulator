class DrawVertical < Base
  def exec
    super

    @bitmap.pixels.tap do |pixels|
      row_indices.each { |row_index| pixels[row_index][column_index] = colour }
    end
  end

private

  def column_index
    coordinates.first - 1
  end

  def positions
    @positions ||= coordinates.last(2).map{ |coordinate| coordinate - 1 }.sort
  end

  def row_indices
    @row_indices ||= (positions.first..positions.last).to_a
  end
end
