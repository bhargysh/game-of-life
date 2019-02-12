require_relative 'alive_rule'
class NextGenerationRule < AliveRule
    def cell_state_for_neighbour_count(alive_neighbours)
        'a' if alive_neighbours == 2 || alive_neighbours == 3
    end
end