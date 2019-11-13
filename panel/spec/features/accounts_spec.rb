require 'rails_helper'

RSpec.feature 'Accounts', type: :feature do
	before(:each) do
		user =  create(:user)
		login_as(user, :scope => :user)
  	end
	scenario 'Make sure that the users page contains all of the account types' do	
		visit '/users'
		expect(page).to have_content('Admin')
		expect(page).to have_content('Developer')
		expect(page).to have_content('Product Owner')
		expect(page).to have_content('Stage Reviewer')
	end
	scenario 'Make sure that the radio buttons are working' do
		visit '/users'
		choose('radio-1_Admin')
		choose('radio-1_Developer')
		choose('radio-1_Product_Owner')
		choose('radio-1_Stage_Reviewer')
		
		choose('radio-2_Admin')
		choose('radio-2_Developer')
		choose('radio-2_Product_Owner')
		choose('radio-2_Stage_Reviewer')
		
		choose('radio-3_Admin')
		choose('radio-3_Developer')
		choose('radio-3_Product_Owner')
		choose('radio-3_Stage_Reviewer')
		
		choose('radio-4_Admin')
		choose('radio-4_Developer')
		choose('radio-4_Product_Owner')
		choose('radio-4_Stage_Reviewer')
	end
end

