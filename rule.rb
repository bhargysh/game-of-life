require_relative './coordinate'
require_relative './grid'
class Rule
  def fetch(coordinate, grid)
    return nil unless grid.send(self.checker, coordinate)
    alive_neighbours = grid.neighbours(coordinate).select { |n| grid.alive?(n) }.count
    self.cell_state_for_neighbour_count(alive_neighbours)
  end
end
