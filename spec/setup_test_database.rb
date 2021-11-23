# frozen_string_literal: true

require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'meal_picker_test')

  # Clean the meals table
  connection.exec('TRUNCATE chicken_meals;')
  connection.exec('TRUNCATE fish_meals;')
  connection.exec('TRUNCATE meat_meals;')
  connection.exec('TRUNCATE veg_meals;')
end
