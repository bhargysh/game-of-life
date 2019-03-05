require_relative './coordinate'
class Grid
  attr_reader :cells
  def initialize(cells)
    @cells = cells
  end

  def x_range
    0...@cells[0].length
  end

  def y_range
    0...@cells.length
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

  def state(coordinate)
    return nil unless check?(coordinate)
    @cells[coordinate.y][coordinate.x]
  end

  def update(rules)
    new_cells = y_range.map do |y_cell|
      x_range.map do |x_cell|
        coordinate = Coordinate.new(x_cell, y_cell)
        rules.fetch(coordinate, self)
      end
    end
    Grid.new(new_cells)
  end

  def check?(coordinate)
    x_range.include?(coordinate.x) && y_range.include?(coordinate.y)
  end
end
