require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'meal_picker_test')
  result = connection.query("SELECT * FROM meals WHERE id = #{id};")
  result.first
end