require 'pg'
require_relative './../../lib/meal.rb'

def insert_data_and_vist_home

  conn = PG.connect(dbname: 'meal_picker_test')

  # Add the test data
  Meal.create(name: 'Chicken Pot Pie', category: 'chicken')
  Meal.create(name: 'Oven Salmon', category: 'fish')
  Meal.create(name: 'Lasagna', category: 'meat')
  Meal.create(name: 'Gajar Aloo', category: 'veg')

  visit '/'
  
end

def select_category_and_submit(type)

  find('div.options', :text => "#{type.capitalize}").choose(type)

    click_on 'Get Meal Suggestion!'

end