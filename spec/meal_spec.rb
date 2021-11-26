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

      meals = Meal.all('chicken')
      meals_names = meals.map { |meal| meal.name}

      expect(meals_names).to include "Chicken Pot Pie"
      expect(meals_names).to include "Pilau"
    end

    it 'returns a list of meals in the meat category' do
      # Add the test data
      Meal.create(name: 'Lasagna', category: 'meat')
      Meal.create(name: 'Meatballs', category: 'meat')

      meals = Meal.all('meat')
      meals_names = meals.map { |meal| meal.name}
      
      expect(meals_names).to include "Lasagna"
      expect(meals_names).to include "Meatballs"
    end

    it 'returns a list of meals in the fish category' do
      # Add the test data
      Meal.create(name: 'Oven Salmon', category: 'fish')
      Meal.create(name: 'Frozen Fish and Chips', category: 'fish')

      meals = Meal.all('fish')
      meals_names = meals.map { |meal| meal.name}
      
      expect(meals_names).to include "Oven Salmon"
      expect(meals_names).to include "Frozen Fish and Chips"
    end

    it 'returns a list of meals in the veg category' do
      # Add the test data
      Meal.create(name: 'Gajar Aloo', category: 'veg')
      Meal.create(name: 'Bean Burgers', category: 'veg')

      meals = Meal.all('veg')
      meals_names = meals.map { |meal| meal.name}
      
      expect(meals_names).to include "Gajar Aloo"
      expect(meals_names).to include "Bean Burgers"
    end
  end

  describe '.random()' do
    it 'returns random meal in chicken category' do
      Meal.create(name: 'Chicken Pot Pie', category: 'chicken')
  
      meal = Meal.random('chicken')

      expect(meal.name).to eq 'Chicken Pot Pie'
      expect(meal.category).to eq 'chicken'
    end

    it 'returns random meal in meat category' do
      Meal.create(name: 'Lasagna', category: 'meat')
  
      meal = Meal.random('meat')

      expect(meal.name).to eq 'Lasagna'
      expect(meal.category).to eq 'meat'
    end

    it 'returns random meal in fish category' do
      Meal.create(name: 'Fish Pie', category: 'fish')
  
      meal = Meal.random('fish')

      expect(meal.name).to eq 'Fish Pie'
      expect(meal.category).to eq 'fish'
    end

    it 'returns random meal in veg category' do
      Meal.create(name: 'Bean Burgers', category: 'veg')
  
      meal = Meal.random('veg')

      expect(meal.name).to eq 'Bean Burgers'
      expect(meal.category).to eq 'veg'
    end
  end

end