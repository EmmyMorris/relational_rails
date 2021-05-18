require 'rails_helper'

RSpec.describe "Destroy a hospital", type: :feature do
  describe 'index feature tests' do
    it "can see link to delete hosptal" do
      # User Story 19, Parent Delete (x2)
      # As a visitor
      # When I visit a parent show page
      # Then I see a link to delete the parent
      # When I click the link "Delete Parent"
      # Then a 'DELETE' request is sent to '/parents/:id',
      # the parent is deleted, and all child records are deleted
      # and I am redirected to the parent index page where I no longer see this parent
      hospital_1 = Hospital.create!(name: 'St. Johns', max_capacity: false, beds: 300)
      visit "/hospitals/#{hospital_1.id}"
      click_link "Delete Hospital #{hospital_1.name}"
      expect(current_path).to eq("/hospitals/#{hospital_1.id}")
      expect(page).not_to have_content("St. Johns")
    end
  end
end
