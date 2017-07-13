require "matrix"

class Bitmap
  attr_accessor :rows, :columns

  def initialize(rows = 0, columns = 0)
    @rows = rows
    @columns = columns
  end

  def pixels
    @pixels ||= Matrix.build(rows.to_i, columns.to_i){ "O" }.to_a
  end

  def image
    pixels.inject(nil) { |compiler, row| compiler = "#{compiler}#{row.join}\n" }
  end
end
