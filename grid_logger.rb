class GridLogger
    def log(grid)
      output = ""
      columns = grid.x_range.size
      output << "+#{'-'* columns}+\n"
      grid.y_range.reverse_each do |y_cell|
        output << "|"
        grid.x_range.each do |x_cell|
            coordinate = Coordinate.new(x_cell, y_cell)
            if grid.alive?(coordinate)
              output << "@"
            else
              output << "x"
            end
        end
        output << "|\n"
      end
      output << "+#{'-'* columns}+\n"
      output
    end
end