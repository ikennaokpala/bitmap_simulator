class CreateImage < Base
  def exec
    super

    @bitmap.rows = coordinates.last
    @bitmap.columns = coordinates.first

    @bitmap.pixels
  end

private

  def incomplete?
    coordinates.size != 2
  end
end
