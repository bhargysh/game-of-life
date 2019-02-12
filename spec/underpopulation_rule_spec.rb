require_relative '../underpopulation_rule'
require_relative 'grid_fixture'
RSpec.describe(UnderpopulationRule) do
    subject { described_class.new.fetch(coordinate, grid) }
    let(:grid) { GridFixture::GRID }
    context 'when current cell is alive' do
        let(:coordinate) { Coordinate.new(0, 3) }
        it 'returns a dead cell' do
            expect(subject).to eq('d')
        end
    end
    context 'when current cell is dead' do
        let(:coordinate) { Coordinate.new(0, 0) }
        it 'does not apply the rule' do
            expect(subject).to be_nil
        end
    end
end