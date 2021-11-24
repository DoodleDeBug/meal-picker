# frozen_string_literal: true

require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'meal_picker_test')

  # Clean the meals table
  connection.exec('TRUNCATE meals;')
end
