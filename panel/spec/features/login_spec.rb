require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  scenario "User visits the login page" do
    visit "/"
    expect(page).to have_field('username')
    expect(page).to have_field('password')
    expect(page).to have_button('Login')
  end
end
