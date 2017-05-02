require 'rails_helper'

feature 'add a bag' do
  context 'user is signed up' do
    scenario 'should diplay a notice saying no bags' do
      visit '/bags'
      expect(page).to have_link 'Add a bag'
      expect(page).to have_text 'No bags yet'
    end
    scenario 'leads to a form to add a bag' do
      visit '/bags'
      click_link "Add a bag"
      expect(page).to have_text 'Name'
      expect(page).to have_text 'Number'
      expect(page).to have_text 'Details'
    end
  end
end
