require_relative 'rule'
class ReproductionRule < Rule
    def checker
        :dead?
    end

    def cell_state_for_neighbour_count(alive_neighbours)
        'a' if alive_neighbours == 3
    end    
end