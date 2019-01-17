require_relative '../grid'
require_relative '../coordinate'
RSpec.describe(Grid) do
  subject { described_class.new(cells) }

  let(:cells) do
    [ ['a', 'd', 'd'], ['a','a', 'a'], ['a','a', 'a'] ]
  end
  context 'when grid is created' do
    it 'checks if cell is alive' do
      expect(subject.alive?(0,2)).to eq(true)
    end
    it 'checks if cell is dead' do
      expect(subject.dead?(2,0)).to eq(true)
    end
  end
  context 'when grid created is out of range' do
    it 'reports dead cell for out of range y' do
      expect(subject.dead?(0,3)).to eq(true)
    end
    it 'reports dead cell for out of range x' do
      expect(subject.dead?(3,0)).to eq(true)
    end
    it 'reports dead cell' do
      expect(subject.alive?(5,0)).to eq(false)
    end
  end
  context 'cell has neighbours' do
    let(:neighbours) {
      [Coordinate.new(1, 0), Coordinate.new(1, 1), Coordinate.new(1, 2), Coordinate.new(2, 0), Coordinate.new(2, 2), Coordinate.new(3, 0), Coordinate.new(3, 1), Coordinate.new(3, 3)]
    }
    it 'returns the coordinates of its neighbours' do
      expect(subject.neighbours(2, 1)).to match_array(neighbours)
    end
  end
end
