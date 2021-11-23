feature 'homepage' do

  
  scenario 'has title:' do
    visit '/'
    expect(page).to have_title 'Meal Picker'
  end

  scenario 'shows meal category options:' do
    visit '/'

    within('#meal_category_form') { 
      expect(page).to have_content 'Chicken' 
      expect(page).to have_content 'Fish'
      expect(page).to have_content 'Meat'
      expect(page).to have_content 'Veg'

      expect(page).to have_button 'Get Meal Suggestion!'
    }

  end

  scenario 'meal category options have form css' do
    visit '/'

    within('.form_container') { 
      expect(page).to have_css '.form' 
    }

  end
end