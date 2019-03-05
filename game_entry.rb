#!/usr/bin/env ruby
require_relative './grid'
require_relative './rules'
require_relative './grid_logger'
require_relative './grid_gif_logger'

cells =
[
    ['d', 'd', 'a', 'd'],
    ['a', 'a', 'a', 'd'],
    ['a', 'd', 'a', 'd'],
    ['a', 'd', 'd', 'd']
]
grid = Grid.new(cells)
rules = Rules.new
logger = GridLogger.new
gif_logger = GridGifLogger.new

puts logger.log(grid)
new_grid = grid.update(rules)
puts logger.log(new_grid)

puts gif_logger.log(grid)