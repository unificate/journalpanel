require 'rails_helper'

RSpec.describe "accounts page" do
	it 'displays a list of users and their privilages' do
		#create a user so that you can view the settings page
		visit('/users/sign_up')
		fill_in 'user_username', with: 'admin'
	        fill_in 'user_password', with: 'PWGFBN9aZv5655G'
		fill_in 'user_password_confirmation', with: 'PWGFBN9aZv5655G'
		click_button 'commit'
		
		#Make sure that the users page contains all of the account types
		visit('/users')
		expect(page).to have_content('Admin')
		expect(page).to have_content('Developer')
		expect(page).to have_content('Product Owner')
		expect(page).to have_content('Stage Reviewer')
		
		#Make sure that the radio buttons are working
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

