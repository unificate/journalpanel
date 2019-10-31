require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  before(:each) do
    create(:user)
  end
  scenario 'User visits the login page' do
    visit '/'
    expect(page).to have_field('username')
    expect(page).to have_field('password')
    expect(page).to have_button('Login')
  end
  scenario "User visits the login page" do
    visit '/'
    fill_in 'username', with: 'tester'
    fill_in 'password', with: 'tester'
    click_button 'Login'
    expect(page).to have_current_path('/list')
  end
end
