require 'space'
require 'pg'

RSpec.describe Space do
  describe '#self.all' do
    xit 'returns list of spaces' do
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

  describe '#self.available' do
    it 'returns list of available spaces' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Amy''s space', true, 'A lovely flat', 150.50);")
      connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Kev''s space', true, 'A lovely house', 200.00);")
      connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Ollie''s space', true, 'A not so lovely flat', 10.25);")
      
      Space.book("Amy's space")
      available_spaces = Space.available

      expect(available_spaces[0].name).to eq("Kev's space")
      expect(available_spaces[0].space_description).to eq("A lovely house")
      expect(available_spaces[0].price).to eq("200")
      expect(available_spaces[1].name).to eq("Ollie's space")
      expect(available_spaces.length).to eq 2
    end
  end

  describe '#self.create' do
    it 'creates a new space listing' do
      new_space = Space.create("Murphy's couch", "A lovely comfy couch", "9.99")
      expect(new_space.name).to eq("Murphy's couch")
      expect(new_space.space_description).to eq("A lovely comfy couch")
      expect(new_space.price).to eq(9.99)
      expect(new_space.available).to eq("t")
    end
  end
end
