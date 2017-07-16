class ColourPixel < Base
  def exec
    super
    
    @bitmap.pixels.tap do |pixels|
      pixels[positions.last][positions.first] = colour
    end
  end
end
