feature 'homepage' do

  
  scenario 'has title:' do
    visit '/'
    expect(page).to have_title 'Meal Picker'
  end

  

  scenario 'shows meal category options:' do
    visit '/'

    expect(page).to have_content 'Choose Your Meal Category'

    within('#meal_category_form') { 
      expect(page).to have_field 'Chicken' 
      expect(page).to have_field 'Fish'
      expect(page).to have_field 'Meat'
      expect(page).to have_field 'Veg'

      expect(page).to have_button 'Get Meal Suggestion!'
    }

  end

  scenario 'meal category options have form css' do
    visit '/'

    within('.form_container') { 
      expect(page).to have_css '.form' 
      expect(page).to have_css 'label' 
      expect(page).to have_css '.options' 
      expect(page).to have_css '.button' 
    }

  end
end