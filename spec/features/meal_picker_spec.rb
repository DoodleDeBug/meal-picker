require_relative './web_helper.rb'

feature 'meal picker' do

  scenario 'suggests chicken meal when you pick chicken:' do
    insert_data_and_vist_home
    select_category_and_submit('chicken')

    within('#msg_container') { 
      expect(page).to have_content 'Chicken Pot Pie'
    } 
  end

  scenario 'suggests fish meal when you pick fish:' do
    insert_data_and_vist_home
    select_category_and_submit('fish')

    within('#msg_container') { 
      expect(page).to have_content 'Oven Salmon'
    }  
  end

  scenario 'suggests meat meal when you pick meat:' do
    insert_data_and_vist_home
    select_category_and_submit('meat')

    within('#msg_container') { 
      expect(page).to have_content 'Lasagna'
    } 
  end

  scenario 'suggests veg meal when you pick veg:' do
    insert_data_and_vist_home
    select_category_and_submit('veg')

    within('#msg_container') { 
      expect(page).to have_content 'Gajar Aloo'
    }  
  end
  
end