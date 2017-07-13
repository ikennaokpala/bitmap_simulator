class ClearTable
  def initialize(bitmap)
    @bitmap = bitmap
  end

  def exec
    @bitmap.pixels.tap do |pixels|
      pixels.each_with_index do |row, index|
        pixels[index] = Array.new(row.size) { "O" }
      end
    end
  end
end
