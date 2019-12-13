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
end
