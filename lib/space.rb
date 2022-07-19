require 'pg'

class Space
  
  attr_reader :name

  def initialize(name:)
    @name = name
  end

  def self.all
    connection = PG.connect(dbname: 'makersbnb')

    spaces = connection.exec("SELECT name FROM spaces")
    spaces.map { |space| Space.new(name: space['name']) }
  end

  def self.book(space)
  end

  def self.available
  end
end
