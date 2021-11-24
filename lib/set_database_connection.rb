require 'pg'

def set_environment
  if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'meal_picker_test')
  else
    PG.connect(dbname: 'meal_picker')
  end
end
