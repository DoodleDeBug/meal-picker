feature 'new meal form' do

  scenario 'has input field for name' do
    visit '/new_meal'

    within('#new_meal_form') { 
      expect(page).to have_field_labeled 'meal_name'
    } 
  end

  scenario 'has input field for category' do
    visit '/new_meal'
  
    within('#new_meal_form') { 
      expect(page).to have_field_labeled 'meal_category'
    } 
  end

  scenario 'has submit button' do
    visit '/new_meal'
  
    within('#new_meal_form') { 
      expect(page).to have_button 'Submit'
    } 
  end

end