require 'pg'

def insert_data_and_vist_home

  conn = PG.connect(dbname: 'meal_picker_test')

  # Add the test data
  conn.exec("INSERT INTO meals (name) VALUES ('Chicken Pot Pie', 'chicken');")
  conn.exec("INSERT INTO meals (name) VALUES ('Oven Salmon', 'fish');")
  conn.exec("INSERT INTO meals (name) VALUES ('Lasagna', 'meat');")
  conn.exec("INSERT INTO meals (name) VALUES ('Gajar Aloo', 'veg');")

  visit '/'
  
end