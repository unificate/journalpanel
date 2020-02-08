require 'rails_helper'

RSpec.feature 'Accounts', type: :feature do
	before(:each) do
                admin = create(:admin)
                login_as(admin, :scope => :user)
        end
	scenario 'Make sure that the users page contains all of the account types' do
		visit '/users'
		expect(page).to have_content('Admin')
		expect(page).to have_content('Developer')
		expect(page).to have_content('Product Owner')
		expect(page).to have_content('Release Manager')
	end
	scenario 'Make sure that the radio buttons are working' do
		visit '/users'
		User.order('username').each_with_index do |user, index|
                  choose('radio-admin-' + index.to_s, visible: false)
                  choose('radio-developer-' + index.to_s, visible: false)
                  choose('radio-productowner-' + index.to_s, visible: false)
                  choose('radio-releasemanager-' + index.to_s, visible: false)
		end
  	end

	scenario 'The admin should be able to logout from the panel' do
		visit '/users'
		click_button('user-button')
		page.find('li', :text => 'Logout').click
		expect(page).to have_current_path('/')
		expect(page).to have_content('Login')
	end

	scenario 'The admin should be able to logout from the microservices page' do
		visit '/list'
		click_button('user-button')
		page.find('li', :text => 'Logout').click
		expect(page).to have_current_path('/')
		expect(page).to have_content('Login')
	end

	scenario 'The admin should be able to create a new user' do
		visit '/users'
		fill_in 'username', with: 'newDeveloper'
		fill_in 'password', with: 'p@ssw0rd'
		choose('radio-developer-new', visible: false)
		click_button('create-button')
		expect(page).to have_current_path('/users')
		expect(page).to have_text('newdeveloper')
	end

	scenario 'Product owner can view microservices' do
		productOwner = create(:product_owner)
		login_as(productOwner, :scope => :user)
		visit '/list'
		expect(page).to have_current_path('/list')
		expect(page).to have_content('B.SMITH')	
	end
	
	scenario 'Product owner cannot view the admin panel' do
		productOwner = create(:product_owner)
		login_as(productOwner, :scope => :user)
		visit '/users'
		expect(page).to have_current_path('/list')  
		expect(page).to have_content('B.SMITH')	
	end

	scenario 'Developer can view microservices' do
		developer = create(:developer)
		login_as(developer, :scope => :user)
		visit '/list'
		expect(page).to have_current_path('/list')
		expect(page).to have_content('DEVELOPER')
	end

	scenario 'Developer cannot access the admin panel' do
		developer = create(:developer)
		login_as(developer, :scope => :user)
		visit '/users'
		expect(page).to have_current_path('/list')
		expect(page).to have_content('DEVELOPER')
	end

	scenario 'Realease manager can view microservices' do
		rm = create(:release_manager)
		login_as(rm, :scope => :user)
		visit '/list'
		expect(page).to have_current_path('/list')
		expect(page).to have_content('RELEASE_MANAGER')
	end
	
	scenario 'Realease manager cannot access the admin panel' do
                rm = create(:release_manager)
                login_as(rm, :scope => :user)
                visit '/users'
                expect(page).to have_current_path('/list')
                expect(page).to have_content('RELEASE_MANAGER')
        end

	scenario 'The admin can update a user\'s role' do
		visit '/users'
		choose('radio-releasemanager-0')
		click_button('Update-Role')
		expect_page.to have_current_path('/users')
		expect(find_field("radio-releasemanager-0")).to be_checked		
	end

end


