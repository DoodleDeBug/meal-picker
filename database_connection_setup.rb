# frozen_string_literal: true

require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('meal_picker_test')
else
  DatabaseConnection.setup('meal_picker')
end
