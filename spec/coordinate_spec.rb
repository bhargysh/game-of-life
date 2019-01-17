require_relative '../coordinate'
RSpec.describe(Coordinate) do
  subject { described_class.new(x_coordinate, y_coordinate) }

  context 'when cell is given' do
    let(:x_coordinate) { 2 }
    let(:y_coordinate) { 1 }
    it 'returns the x coordinate' do
      expect(subject.x).to eq(x_coordinate)
    end

    it 'returns the y coordinate' do
      expect(subject.y).to eq(y_coordinate)
    end

    context 'exposes its neighbour cell' do
      it 'returns the neighbour to the left' do
        expect(subject.left).to eq(Coordinate.new(1, 1))
      end
      it 'returns the neighbour to the right' do
        expect(subject.right).to eq(Coordinate.new(3, 1))
      end
      it 'returns the neighbour above the cell' do
        expect(subject.up).to eq(Coordinate.new(2, 2))
      end
      it 'returns the neighbour below the cell' do
        expect(subject.down).to eq(Coordinate.new(2, 0))
      end

    end

  end
end
