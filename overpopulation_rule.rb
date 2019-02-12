require_relative 'alive_rule'
class OverpopulationRule < AliveRule
    def cell_state_for_neighbour_count(alive_neighbours)
        'd' if alive_neighbours > 3 
    end
end