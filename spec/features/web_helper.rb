require 'pg'

def insert_data_and_vist_home

  conn = PG.connect(dbname: 'meal_picker_test')

  # Add the test data
  conn.exec("INSERT INTO meals (name, category) VALUES ('Chicken Pot Pie', 'chicken');")
  conn.exec("INSERT INTO meals (name, category) VALUES ('Oven Salmon', 'fish');")
  conn.exec("INSERT INTO meals (name, category) VALUES ('Lasagna', 'meat');")
  conn.exec("INSERT INTO meals (name, category) VALUES ('Gajar Aloo', 'veg');")

  visit '/'
  
end