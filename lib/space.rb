require 'pg'

class Space
  
  attr_reader :name, :available

  def initialize(name:, available:)
    @name = name
    @available = available
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    spaces = connection.exec("SELECT name, available FROM spaces")
    spaces.map { |space| Space.new(name: space['name'], available: space['available']) }
  end

  def self.book(space_name)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    name = space_name.gsub("'", "''")
    result = connection.exec(
      "UPDATE spaces SET available = false WHERE name = '#{name}' RETURNING name, available"
      ).first
    
    return Space.new(name: result['name'], available: result['available'])
  end

  def self.available
  end
end
