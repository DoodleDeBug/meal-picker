require_relative './../lib/meal'

describe Meal do

  describe '.create' do
    it 'creates a new meal' do
      meal = Meal.create(name: 'Chicken Pot Pie', category: 'chicken')
      persisted_data = PG.connect(dbname: 'meal_picker_test').query("SELECT * FROM meals WHERE id = #{meal.id};")
  
      expect(meal).to be_a meal
      expect(meal.id).to eq persisted_data.first['id']
      expect(meal.name).to eq 'Chicken Pot Pie'
      expect(meal.category).to eq 'chicken'
    end

  end

  it 'returns the name of the meal' do

  end

  # describe '.all_chicken' do
  #   it 'returns a list of meals in the chicken category' do
  #     conn = PG.connect(dbname: 'meal_picker_test')

  #     # Add the test data
  #     conn.exec("INSERT INTO chicken_meals (name) VALUES ('Chicken Pot Pie');")
  #     conn.exec("INSERT INTO chicken_meals (name) VALUES ('Pilau');")

  #     chicken_meals = Meal.all_chicken

  #     expect(chicken_meals).to include "Chicken Pot Pie"
  #     expect(chicken_meals).to include "Pilau"

  #   end
end