require_relative 'alive_rule'
class UnderpopulationRule < AliveRule
    def cell_state_for_neighbour_count(alive_neighbours)
        'd' if alive_neighbours < 2
    end
end