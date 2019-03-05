class GridLogger
    def log(grid)
      output = ""
      columns = grid.y_range.size
      output << "+#{'-'* columns}+\n"
      grid.y_range.reverse_each do |y_cell|
          grid.x_range.each do |x_cell|
            coordinate = Coordinate.new(x_cell, y_cell)
            output << "|" unless grid.check?(coordinate.left)
            if grid.alive?(coordinate)
              output << "@"
            else
              output << "x"
            end
            output << "|\n" unless grid.check?(coordinate.right)
          end
      end
      output << "+#{'-'* columns}+\n"
      output
    end
end