class InCompleteError < StandardError
  def initialize
    super("InComplete Error: Row and/or columns have not been supplied")
  end
end
