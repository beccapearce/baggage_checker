require 'rails_helper'

feature 'sign up' do
  context 'user not signed up' do
    scenario 'should display a prompt to sign up' do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end
    scenario 'should display a form to sign up' do
      visit '/'
      click_link 'Sign up'
      expect(page).to have_text 'Name'
      expect(page).to have_text 'Group'
      expect(page).to have_text 'Password'
      expect(page).to have_text 'Confirm Password'
    end
    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    scenario 'user can fill out form and submit' do
      visit '/users/new'
      fill_in 'user[name]', with: "Winnie-the-Pooh"
      fill_in 'user[group]', with: "100"
      fill_in 'user[password]', with: "100acres"
      fill_in 'user[confirm_password]', with: "100acres"
      click_button "Submit"
      expect(page).to have_content("You have created a new account!")
      expect(current_path).to eq '/bags'
    end
  end
end
