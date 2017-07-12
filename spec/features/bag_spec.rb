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
    it "should show details of a bag when clicked" do
      add_bag
      click_link "Piglet"
      expect(page).to have_content ("Small pink bag on wheels")
    end
    it "should be able to edit a bag" do
      add_bag
      click_link "Edit Piglet"
      fill_in 'bag[name]', with: "Tigger"
      click_button "Update Bag"
      expect(page).to have_content("Tigger")
      expect(page).to have_content("Edit Tigger")
      expect(page).to have_content("Delete Tigger")
      expect(current_path).to eq '/bags'
    end
    it "should be able to delete a bag" do
      add_bag
      click_link "Delete Piglet"
      expect(page).not_to have_content("Piglet")
    end

  end
end
