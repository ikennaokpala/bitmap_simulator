class InvalidCoordinatesError < StandardError
  def initialize
    super("InvalidCoordinates Error: Out of bounds needs to be between 1 to 250")
  end
end
