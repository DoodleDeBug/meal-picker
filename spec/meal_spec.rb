require_relative './../lib/meal'

describe Meal do

  describe '.create' do
    it 'creates a new meal' do
      meal = Meal.create(name: 'Chicken Pot Pie', category: 'chicken')
      # persisted_data = PG.connect(dbname: 'meal_picker_test').query("SELECT * FROM meals WHERE id = #{meal.id};")
  
      expect(meal).to be_a Meal
      # expect(meal.id).to eq persisted_data.first['id']
      expect(meal.name).to eq 'Chicken Pot Pie'
      expect(meal.category).to eq 'chicken'
    end
  end

  describe '.all()' do

    conn = PG.connect(dbname: 'meal_picker_test')
  
    it 'returns a list of meals in the chicken category' do
      # Add the test data
      conn.exec("INSERT INTO meals (name, category) VALUES ('Chicken Pot Pie', 'chicken');")
      conn.exec("INSERT INTO meals (name, category) VALUES ('Pilau', 'chicken');")

      chicken_meals = Meal.all('chicken')

      expect(chicken_meals).to include "Chicken Pot Pie"
      expect(chicken_meals).to include "Pilau"
    end

    it 'returns a list of meals in the meat category' do
      # Add the test data
      conn.exec("INSERT INTO meals (name, category) VALUES ('Lasagna', 'meat');")
  conn.exec("INSERT INTO meals (name, category) VALUES ('Meatballs', 'meat');")

      meat_meals = Meal.all('meat')
      
      expect(meat_meals).to include "Lasagna"
      expect(meat_meals).to include "Meatballs"
    end

    it 'returns a list of meals in the fish category' do
      # Add the test data
      conn.exec("INSERT INTO meals (name, category) VALUES ('Oven Salmon', 'fish');")
      conn.exec("INSERT INTO meals (name, category) VALUES ('Frozen Fish and Chips', 'fish');")

      fish_meals = Meal.all('fish')
      
      expect(fish_meals).to include "Oven Salmon"
      expect(fish_meals).to include "Frozen Fish and Chips"
    end

    it 'returns a list of meals in the veg category' do
      # Add the test data
      conn.exec("INSERT INTO meals (name, category) VALUES ('Gajar Aloo', 'veg');")
      conn.exec("INSERT INTO meals (name, category) VALUES ('Bean Burgers', 'veg');")

      veg_meals = Meal.all('veg')
      
      expect(veg_meals).to include "Gajar Aloo"
      expect(veg_meals).to include "Bean Burgers"
    end
  end

end