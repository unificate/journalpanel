require 'rails_helper'

RSpec.feature 'Logins', type: :feature do
  before(:each) do
    create(:admin)
  end
  scenario 'User visits the login page' do
    visit '/'
    expect(page).to have_field('Username')
    expect(page).to have_field('Password')
    expect(page).to have_button('Log In')
  end
  scenario "User logins using an invalid username and password" do
    visit '/'
    expect(page).not_to have_text('Invalid username or password.')
    fill_in 'username', with: 'tester'
    fill_in 'password', with: 'wrong'
    click_button 'Log In'
    expect(page).to have_current_path('/')
    expect(page).to have_text('Invalid username or password')
  end
  scenario "User logins using a valid username and password" do
    visit '/'
    fill_in 'username', with: 'tester'
    fill_in 'password', with: 'tester'
    click_button 'Log In'
    expect(page).to have_current_path('/list')
  end
  scenario "User visits login page while logged in" do
    visit '/'
    fill_in 'username', with: 'tester'
    fill_in 'password', with: 'tester'
    click_button 'Log In'
    visit '/'
    expect(page).to have_current_path('/list')
  end
end
