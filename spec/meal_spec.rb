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
      Meal.create(name: 'Chicken Pot Pie', category: 'chicken')
      Meal.create(name: 'Pilau', category: 'chicken')

      chicken_meals = Meal.all('chicken')

      expect(chicken_meals).to include "Chicken Pot Pie"
      expect(chicken_meals).to include "Pilau"
    end

    it 'returns a list of meals in the meat category' do
      # Add the test data
      Meal.create(name: 'Lasagna', category: 'meat')
      Meal.create(name: 'Meatballs', category: 'meat')

      meat_meals = Meal.all('meat')
      
      expect(meat_meals).to include "Lasagna"
      expect(meat_meals).to include "Meatballs"
    end

    it 'returns a list of meals in the fish category' do
      # Add the test data
      Meal.create(name: 'Oven Salmon', category: 'fish')
      Meal.create(name: 'Frozen Fish and Chips', category: 'fish')

      fish_meals = Meal.all('fish')
      
      expect(fish_meals).to include "Oven Salmon"
      expect(fish_meals).to include "Frozen Fish and Chips"
    end

    it 'returns a list of meals in the veg category' do
      # Add the test data
      Meal.create(name: 'Gajar Aloo', category: 'veg')
      Meal.create(name: 'Bean Burgers', category: 'veg')

      veg_meals = Meal.all('veg')
      
      expect(veg_meals).to include "Gajar Aloo"
      expect(veg_meals).to include "Bean Burgers"
    end
  end

end