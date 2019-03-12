require_relative './grid'
require 'RMagick'
include Magick

class GridGifLogger
    def initialize(filename)
        @filename = filename
        @image_list = ImageList.new
    end
    
    def log(grid)
        image = Image.new(grid.x_range.size, grid.y_range.size) { self.background_color = "red" }
        alive_colour = [0, 65535, 32768]
        dead_colour = [0, 0, 0]
        output = []
        grid.y_range.reverse_each do |y_cell|
            grid.x_range.each do |x_cell|
                coordinate = Coordinate.new(x_cell, y_cell)
                if grid.alive?(coordinate)
                    output.concat(alive_colour)
                else
                    output.concat(dead_colour)
                end
            end
        end
        image.import_pixels(0, 0, grid.x_range.size, grid.y_range.size, "RGB", output)
        image.scale!(10)
        @image_list << image
        @image_list.write(@filename)
    end
end