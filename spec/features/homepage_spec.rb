feature 'homepage' do

  
  scenario 'has title:' do
    visit '/'
    expect(page).to have_title 'Meal Picker'
  end

  # scenario 'shows meal category options:' do
  #   visit '/'

  # end
end