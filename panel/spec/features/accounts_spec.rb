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

  scenario 'The admin should be able to logout from the panel' do
    visit '/users'
    click_button('dropdownMenuButton')
    page.find('.logoutDrop').click
    expect(page).to have_current_path('/')
    expect(page).to have_content('Log In')
  end

  scenario 'The admin should be able to create a new user' do
    visit '/users'
    fill_in 'Username', with: 'newDeveloper'
    fill_in 'Password', with: 'p@ssw0rd'
    choose('user_role_Developer', visible: false)
    click_button('Create')
    expect(page).to have_current_path('/users')
    expect(page).to have_text('newdeveloper')
  end

  scenario 'Product owner can view microservices' do
    productOwner = create(:product_owner)
    login_as(productOwner, :scope => :user)
    visit '/list'
    expect(page).to have_current_path('/list')
  end

  scenario 'Product owner cannot view the admin panel' do
    productOwner = create(:product_owner)
    login_as(productOwner, :scope => :user)
    visit '/users'
    expect(page).to have_current_path('/list')
  end

  scenario 'Developer can view microservices' do
    developer = create(:developer)
    login_as(developer, :scope => :user)
    visit '/list'
    expect(page).to have_current_path('/list')
  end

  scenario 'Developer cannot access the admin panel' do
    developer = create(:developer)
    login_as(developer, :scope => :user)
    visit '/users'
    expect(page).to have_current_path('/list')
  end

  scenario 'Release manager can view microservices' do
    rm = create(:release_manager)
    login_as(rm, :scope => :user)
    visit '/list'
    expect(page).to have_current_path('/list')
  end

  scenario 'Release manager cannot access the admin panel' do
    rm = create(:release_manager)
    login_as(rm, :scope => :user)
    visit '/users'
    expect(page).to have_current_path('/list')
  end

  scenario 'An admin can update a user\'s role' do
    developer = create(:developer)
    visit '/users'
    choose('radio-admin-0', visible: false)
    visit '/users'
    expect(find_field("radio-admin-0", visible: false)).to be_checked
    choose('radio-developer-0', visible: false)
    visit '/users'
    expect(find_field("radio-developer-0", visible: false)).to be_checked
    choose('radio-productowner-0', visible: false)
    visit '/users'
    expect(find_field("radio-productowner-0", visible: false)).to be_checked
    choose('radio-releasemanager-0', visible: false)
    visit '/users'
    expect(find_field("radio-releasemanager-0", visible: false)).to be_checked
  end

  scenario 'An admin can not update their own role' do
    developer = create(:developer)
    visit '/users'
    expect(page).to have_field("radio-admin-1", visible: false, disabled: true)
    expect(page).to have_field("radio-developer-1", visible: false, disabled: true)
    expect(page).to have_field("radio-productowner-1", visible: false, disabled: true)
    expect(page).to have_field("radio-releasemanager-1", visible: false, disabled: true)
  end

  scenario 'An admin can change a user\'s password' do
    visit '/users'
    page.find('.dropdownMenuLinkC').click
    page.find('.dropdownPassword').click
    fill_in 'password-modal-password', with: 'password2'
    click_button('Save')
    click_button('dropdownMenuButton')
    page.find('.logoutDrop').click
    fill_in 'username', with: 'tester'
    fill_in 'password', with: 'password2'
    click_button 'Log In'
    expect(page).to have_current_path('/list')
  end

  scenario 'An admin can delete a user' do
    developer = create(:developer)
    visit '/users'
    expect(page.all('.dropdownMenuLinkC').count).to eq(2)
    page.all('.dropdownMenuLinkC').first.click
    page.all('.dropdownDelete', visible: false).first.click
    click_button('DELETE')
    expect(page.all('.dropdownMenuLinkC').count).to eq(1)
  end
end
