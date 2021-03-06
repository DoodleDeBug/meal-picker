require_relative'./set_database_connection.rb'

class Meal

  attr_reader :name, :id, :category

  def initialize(name:, id:, category:)
    @name = name
    @id = id
    @category = category
  end

  def self.create(name:, category:)
    connection = set_environment #use helper method to set env based of of ENV variable - see set_database_connection.rb

    result = connection.exec("INSERT INTO meals (name, category) VALUES('#{name}', '#{category}') RETURNING id, name, category")
    Meal.new(id: result[0]['id'], name: result[0]['name'], category: result[0]['category'])

  end

  def self.all(category)
    conn = set_environment #use helper method to set env based of of ENV variable - see set_database_connection.rb

    result = conn.exec("SELECT * FROM meals WHERE category='#{category}';")

    result.map { |meal| Meal.new(id: meal['id'], name: meal['name'], category: meal['category'])} # returns an array of meal names
  end

  def self.random(category)
    meals =  self.all(category)
    index = rand(meals.length)
    return meals[index] # aka random meal from the array of meals in a certain category
  end

end