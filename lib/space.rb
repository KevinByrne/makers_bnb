require 'pg'

class Space
  
  attr_reader :name, :available, :space_description, :price

  def initialize(name:, available:, space_description:, price:)
    @name = name
    @available = available
    @space_description = space_description
    @price = price
  end

  # def self.all
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'makersbnb_test')
  #   else
  #     connection = PG.connect(dbname: 'makersbnb')
  #   end

  #   spaces = connection.exec("SELECT name, available FROM spaces")
  #   spaces.map { |space| Space.new(name: space['name'], available: space['available']) }
  # end

  def self.book(space_name)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    name = space_name.gsub("'", "''")
    result = connection.exec(
      "UPDATE spaces SET available = false WHERE name = '#{name}' RETURNING name, available, space_description, price"
      ).first
    
    return Space.new(
      name: result['name'], 
      available: result['available'], 
      space_description: result['space_description'], 
      price: result['price']
      )
  end

  def self.available
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    available_spaces = connection.exec(
      "SELECT name, available, space_description, price FROM spaces WHERE available = true"
      )
    available_spaces.map do |space|
      Space.new(
        name: space['name'], 
        available: space['available'], 
        space_description: space['space_description'], 
        price: space['price']
        )
    end
  end

  def self.create(name, space_description, price)
  
  end
end
