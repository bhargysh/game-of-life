class Grid
  def initialize(cells)
    @cells = cells
  end

  def alive?(x, y)
    return false unless check?(x, y)
    @cells[y][x] == 'a'
  end

  def dead?(x, y)
    return true unless check?(x, y)
    @cells[y][x] == 'd'
  end

  private
  def check?(x, y)
    x_range = 0...@cells[0].length
    y_range = 0...@cells.length
    x_range.include?(x) && y_range.include?(y)
  end
end
