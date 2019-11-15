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
		@user = User.order('username')
		choice1 = @user[0].username+"_Admin"
		choice2 = @user[0].username+"_Developer"
		choice3 = @user[0].username+"_Product_Owner"
		choice4 = @user[0].username+"_Stage_Reviewer"
		choose(choice1)
		choose(choice2)
		choose(choice3)
		choose(choice4)
	end
end

