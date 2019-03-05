require_relative '../grid_logger'
require_relative 'grid_fixture'
RSpec.describe(GridLogger) do
    subject { described_class.new }

    describe '#log' do
        let(:grid) { GridFixture::GRID }
        let(:grid_output) { 
            [
                "+----+\n",
                "|@xxx|\n",
                "|@x@x|\n",
                "|@@@x|\n",
                "|xx@x|\n",
                "+----+\n"
            ].join
        }
        it 'outputs the grid' do
            expect(subject.log(grid)).to eq(grid_output)
        end
    end
end