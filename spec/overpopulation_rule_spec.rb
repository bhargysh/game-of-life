require_relative '../overpopulation_rule'
require_relative 'grid_fixture'
RSpec.describe(OverpopulationRule) do
    subject { described_class.new.fetch(coordinate, grid) }
    let(:grid) { GridFixture::GRID }
    context 'when cell is alive and it has 4 neighbours' do
        let(:coordinate) { Coordinate.new(1, 1) }
        it 'returns a dead cell' do
            expect(subject).to eq('d')
        end
    end
    context 'when cell is alive and it has 3 neighbours' do
        let(:coordinate) { Coordinate.new(3, 1) }
        it 'does not apply the rule' do
            expect(subject).to be_nil
        end
    end
end