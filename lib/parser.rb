class Parser
  def initialize(line)
    @line = line
  end

  def fragments
    @fragments ||= @line.split("", 2)
  end

  def command
    fragments.first.strip
  end

  def arguments
    fragments.last.strip.split(" ")
  end
end
