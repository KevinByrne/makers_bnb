require 'space'
require 'pg'

RSpec.describe Space do
  describe '#self.all' do
    it 'returns list of spaces' do
      spaces = Space.all
      
      expect(spaces[0].name).to eq("Amy's space")
      expect(spaces[1].name).to eq("Kev's space")
      expect(spaces[2].name).to eq("Ollie's space")
    end
  end
end
