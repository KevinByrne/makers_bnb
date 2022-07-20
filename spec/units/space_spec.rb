require 'space'
require 'pg'

RSpec.describe Space do
  describe '#self.all' do
    it 'returns list of spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO spaces (name, available) VALUES ('Amy''s space', true);")
      connection.exec("INSERT INTO spaces (name, available) VALUES ('Kev''s space', true);")
      connection.exec("INSERT INTO spaces (name, available) VALUES ('Ollie''s space', true);")
      
      spaces = Space.all
      
      expect(spaces[0].name).to eq("Amy's space")
      expect(spaces[1].name).to eq("Kev's space")
      expect(spaces[2].name).to eq("Ollie's space")
    end
  end

  describe '#self.book' do
    it 'updates space to be unavailable' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO spaces (name, available) VALUES ('Amy''s space', true);")
 
      booked_space = Space.book("Amy's space")
      expect(booked_space.available).to eq "f"
    end
  end
end
