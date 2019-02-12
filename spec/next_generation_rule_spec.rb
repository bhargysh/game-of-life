require_relative '../next_generation_rule'
require_relative 'grid_fixture'
RSpec.describe(NextGenerationRule) do
    subject { described_class.new.fetch(coordinate, grid) }
    let(:grid) { GridFixture::GRID }
    context 'when the cell is alive and it has 2 neighbours' do
        let(:coordinate) { Coordinate.new(2, 2) }
        it 'returns an alive cell' do
            expect(subject).to eq('a')
        end
    end
    context 'when the cell is alive and it has 3 neighbours' do
        let(:coordinate) { Coordinate.new(2, 1) }
        it 'returns an alive cell' do
            expect(subject).to eq('a')
        end
    end
    context 'when the cell is alive and it has 1 neighbour' do
        let(:coordinate) { Coordinate.new(0, 3) }
        it 'does not apply the rule' do
            expect(subject).to be_nil
        end
    end
end