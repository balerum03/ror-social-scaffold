# rubocop: disable Layout/BlockLength
require 'rails_helper'

feature 'authentication features', type: :feature do
  feature 'creating a new user' do
    before(:example) do
      visit '/users/sign_up'
    end

    scenario 'create and account with valid params' do
      fill_in 'user[name]', with: 'Adan'
      fill_in 'user[email]', with: 'test@test.com'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_on 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
      expect(current_path).to eq('/')
    end

    scenario "Can't create an account if one param is missing" do
      fill_in 'user[name]', with: 'Adan'
      fill_in 'user[email]', with: 'test@test.com'
      fill_in 'user[password]', with: '123456'
      click_on 'Sign up'
      expect(page).to have_content('Password confirmation doesn\'t match Password')
      expect(current_path).to eq('/users')
    end
  end

  feature 'Log in as an existing user' do
    before(:example) do
      User.create(name: 'bbosa', email: 'test@test2.com', password: '123456')
    end

    scenario 'Log in with valid params' do
      visit 'users/sign_in'
      fill_in 'user[email]', with: 'test@test2.com'
      fill_in 'user[password]', with: '123456'
      click_on 'Log in'
      expect(page).to have_content('Signed in successfully.')
      expect(current_path).to eq('/')
    end

    scenario 'log in with invalid params' do
      visit 'users/sign_in'
      fill_in 'user[email]', with: 'test@test2.com'
      click_on 'Log in'
      expect(page).to have_content('Invalid Email or password.')
      expect(current_path).to eq('/users/sign_in')
    end
  end

  feature 'Log out user' do
    before(:example) do
      User.create(name: 'bbosa', email: 'test@test2.com', password: '123456')
      visit 'users/sign_in'
      fill_in 'user[email]', with: 'test@test2.com'
      fill_in 'user[password]', with: '123456'
      click_on 'Log in'
    end

    scenario 'Logging out' do
      click_on 'Sign out'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
      expect(current_path).to eq('/users/sign_in')
    end
  end
end
# rubocop: enable Layout/BlockLength
