require_relative '../grid'
require_relative '../coordinate'
require_relative '../rules'
RSpec.describe(Grid) do
  subject { described_class.new(cells) }

  let(:cells) do
    [
      ['a', 'd', 'd'],
      ['a', 'a', 'a'],
      ['a', 'a', 'a']
    ]
  end
  context 'when grid is created' do
    it 'checks if cell is alive' do
      expect(subject.alive?(Coordinate.new(0, 2))).to eq(true)
    end
    it 'checks if cell is dead' do
      expect(subject.dead?(Coordinate.new(2, 0))).to eq(true)
    end
  end
  context 'when grid created is out of range' do
    it 'reports dead cell for out of range y' do
      expect(subject.dead?(Coordinate.new(0, 3))).to eq(true)
    end
    it 'reports dead cell for out of range x' do
      expect(subject.dead?(Coordinate.new(3, 0))).to eq(true)
    end
    it 'reports dead cell' do
      expect(subject.alive?(Coordinate.new(5, 0))).to eq(false)
    end
  end
  context 'cell has neighbours' do
    let(:neighbours) {
      [
        Coordinate.new(1, 0), Coordinate.new(1, 1), Coordinate.new(1, 2),
        Coordinate.new(2, 0), Coordinate.new(2, 2), Coordinate.new(3, 0),
        Coordinate.new(3, 1), Coordinate.new(3, 2)
      ]
    }
    it 'returns the coordinates of its neighbours' do
      expect(subject.neighbours(Coordinate.new(2, 1))).to match_array(neighbours)
    end
  end
  describe '#state' do
    context 'when coordinate is on the grid' do
      let(:coordinate) { Coordinate.new(0, 1) }
      it 'returns the state of the cell' do
        expect(subject.state(coordinate)).to eq('a')
      end
    end
    context 'when coordinate is off the grid' do
      let(:coordinate) { Coordinate.new(0, -1) }
      it 'returns nil' do
        expect(subject.state(coordinate)).to be_nil
      end
    end
  end
  context 'when determining next state of a grid' do
    let(:rules) { Rules.new }
    let(:grid) { [
      ['a', 'd', 'd'],
      ['d', 'd', 'a'],
      ['a', 'd', 'a']
    ] }
    it 'returns the new grid' do
      expect(subject.update(rules).cells).to eq(grid)
    end
  end
end
