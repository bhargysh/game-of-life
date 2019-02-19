require_relative 'underpopulation_rule'
require_relative 'overpopulation_rule'
require_relative 'reproduction_rule'
require_relative 'next_generation_rule'
class Rules
    def initialize
       @rules = [
           UnderpopulationRule.new,
           OverpopulationRule.new,
           ReproductionRule.new,
           NextGenerationRule.new
        ]
    end

    def fetch(coordinate, grid)
        @rules.each do |rule|
            cell_state = rule.fetch(coordinate, grid)
            return cell_state unless cell_state.nil?
        end
        raise StandardError, "No rules fired"
    end
end