require 'space'
require 'pg'

RSpec.describe Space do
  describe '#self.all' do
    it 'returns list of spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO spaces (name) VALUES ('Amy''s space');")
      connection.exec("INSERT INTO spaces (name) VALUES ('Kev''s space');")
      connection.exec("INSERT INTO spaces (name) VALUES ('Ollie''s space');")
      
      spaces = Space.all
      
      expect(spaces[0].name).to eq("Amy's space")
      expect(spaces[1].name).to eq("Kev's space")
      expect(spaces[2].name).to eq("Ollie's space")
    end
  end
end
