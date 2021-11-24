feature 'meal picker' do

  scenario 'tells you what category you picked' do
    visit '/'
    find('div.options', :text => 'Chicken').choose('chicken')
    click_on 'Get Meal Suggestion!'
    within('#msg_container') { 
      expect(page).to have_content 'You picked chicken'
    }
    
  end

  
end