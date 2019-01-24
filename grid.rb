require_relative './coordinate'
class Grid
  def initialize(cells)
    @cells = cells
  end

  def alive?(coordinate)
    return false unless check?(coordinate)
    @cells[coordinate.y][coordinate.x] == 'a'
  end

  def dead?(coordinate)
    return true unless check?(coordinate)
    @cells[coordinate.y][coordinate.x] == 'd'
  end

  def neighbours(centre)
    left_neighbour = centre.left
    right_neighbour = centre.right
    [
      centre.up, centre.down, left_neighbour, right_neighbour,
      left_neighbour.up, left_neighbour.down,
      right_neighbour.up, right_neighbour.down
    ]

  end

  private
  def check?(coordinate)
    x_range = 0...@cells[0].length
    y_range = 0...@cells.length
    x_range.include?(coordinate.x) && y_range.include?(coordinate.y)
  end
end
