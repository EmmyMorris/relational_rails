require 'rails_helper'

RSpec.describe "Destroy a hospital", type: :feature do
  describe 'index feature tests' do
    it "can delete a hosptal" do
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
      expect(current_path).to eq("/hospitals")
      expect(page).not_to have_content("St. Johns")
    end

    it "can delete a hosptal from show page" do
      # User Story 22, Parent Delete From Parent Index Page (x1)
      # As a visitor
      # When I visit the parent index page
      # Next to every parent, I see a link to delete that parent
      # When I click the link
      # I am returned to the Parent Index Page where I no longer see that parent
      hospital_1 = Hospital.create!(name: 'St. Johns', max_capacity: false, beds: 300)
      visit "/hospitals"
      click_link "Delete Hospital #{hospital_1.name}"
      expect(current_path).to eq("/hospitals")
      expect(page).not_to have_content("St. Johns")
    end
  end
end
