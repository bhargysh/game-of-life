#!/usr/bin/env ruby
require_relative './grid'
require_relative './rules'
require_relative './grid_logger'
require_relative './grid_gif_logger'
require_relative './timestamp_logger'

cells =
[
    ['d', 'd', 'a', 'd'],
    ['a', 'a', 'a', 'd'],
    ['a', 'd', 'a', 'd'],
    ['a', 'd', 'd', 'd']
]
grid = Grid.new(cells)
rules = Rules.new
logger = TimestampLogger.new(STDOUT, "console", GridLogger.new)
gif_logger = TimestampLogger.new(STDOUT, "gif", GridGifLogger.new("grid.gif"))

puts logger.log(grid)
gif_logger.log(grid)


(1..1000).reduce(grid) do |grid, n|
    new_grid = grid.update(rules)
    puts logger.log(new_grid)
    gif_logger.log(new_grid)
    new_grid
end