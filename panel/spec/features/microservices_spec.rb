require 'rails_helper'

RSpec.feature 'Microservices', type: :feature do
  before(:each) do
    admin = create(:admin)
    login_as(admin, :scope => :user)
  end

  scenario 'The admin should be able to logout from the microservices page' do
    visit '/microservices'
    click_button('dropdownMenuButton')
    page.find('.logoutDrop').click
    expect(page).to have_current_path('/')
    expect(page).to have_content('Log In')
  end
end

