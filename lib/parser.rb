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

  def coordinates_colours
    @coordinates_colours ||= Hash[[:coordinates, :colours].zip(
      fragments.last.strip.split(" ").partition { |arg| arg !~ /[A-Z]/ }
    )]
  end
end
