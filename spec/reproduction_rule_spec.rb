require_relative '../reproduction_rule'
require_relative 'grid_fixture'
RSpec.describe(ReproductionRule) do
    subject { described_class.new.fetch(coordinate, grid) }
    let(:grid) { GridFixture::GRID }
    context 'when cell is dead and it has 3 live neighbours' do
        let(:coordinate) { Coordinate.new(3, 1) }
        it 'returns an alive cell' do
            expect(subject).to eq('a')
        end
    end
    context 'when cell is dead and it has 4 live neighbours' do
        let(:coordinate) { Coordinate.new(2, 1) }
        it 'does not apply the rule' do
            expect(subject).to be_nil
        end
    end
end