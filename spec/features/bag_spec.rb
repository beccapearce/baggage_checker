require 'rails_helper'

feature 'add a bag' do
  context 'user is signed up' do
    scenario 'should diplay a notice saying no bags' do
      visit '/bags'
      expect(page).to have_link 'Add a bag'
      expect(page).to have_text 'No bags yet'
    end
    it "does not show bags on the index page" do
      visit '/bags'
      expect(page).to_not have_text 'Edit'
      expect(page).to_not have_text 'Delete'
    end
    scenario 'leads to a form to add a bag' do
      visit '/bags'
      click_link "Add a bag"
      expect(page).to have_text 'Name'
      expect(page).to have_text 'Number'
      expect(page).to have_text 'Details'
    end
    scenario 'After a bag is added it appears on the index' do
      add_bag
      expect(page).to have_content("Piglet")
      expect(page).to have_content("Edit Piglet")
      expect(page).to have_content("Delete Piglet")
      expect(current_path).to eq '/bags'
    end
  end
end
