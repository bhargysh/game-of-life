class Coordinate < Struct.new(:x, :y)
  def left
    Coordinate.new(x - 1, y)
  end
  def right
    Coordinate.new(x + 1, y)
  end
  def up
    Coordinate.new(x, y + 1)
  end
  def down
    Coordinate.new(x, y - 1)
  end
end
