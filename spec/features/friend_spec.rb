
require 'rails_helper'

feature 'Friend actions', type: :feature do
  feature 'add friend' do
    before(:example) do
      user1 = User.create(name: 'adan', email: 'test@test.com', password: '123456')
      User.create(name: 'bbosa', email: 'test@test2.com', password: '123456')
      visit 'users/sign_in'
      fill_in 'user[email]', with: user1.email
      fill_in 'user[password]', with: user1.password
      click_on 'Log in'
      click_on 'All users'
    end

    scenario 'add a new friend' do
      click_on 'Add as a Friend'
      expect(page).to have_content('pending Request. . .Delete Request')
      expect(current_path).to eq('/users')
    end
  end
end
