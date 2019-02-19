require_relative '../grid'
require_relative '../coordinate'
require_relative '../rules'
require_relative 'grid_fixture'
RSpec.describe(Rules) do
    subject { described_class.new }

    let(:grid) { GridFixture::GRID }
    context 'when underpopulation rule is applied to a cell' do
        let(:coordinate) { Coordinate.new(0, 3) }
        it 'returns new state of the cell' do
            expect(subject.fetch(coordinate, grid)).to eq('d')
        end
    end
    context 'when next generation rule is applied to a cell' do
        let(:coordinate) { Coordinate.new(2, 1) }
        it 'returns new state of the cell' do
            expect(subject.fetch(coordinate, grid)).to eq('a')
        end
    end
    context 'when overpopulation rule is applied to a cell' do
        let(:coordinate) { Coordinate.new(1, 1) }
        it 'returns new state of the cell' do
            expect(subject.fetch(coordinate, grid)).to eq('d')
        end
    end
    context 'when reproduction rule is applied to a cell' do
        let(:coordinate) { Coordinate.new(3, 1) }
        it 'returns new state of the cell' do
            expect(subject.fetch(coordinate, grid)).to eq('a')
        end
    end
end