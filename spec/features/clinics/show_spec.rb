require 'rails_helper'

RSpec.describe "clinics index page", type: :feature do
  it "can see the clinics table" do
    # User Story 2, Parent Show (x2)
    #
    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes:
    # - data from each column that is on the parent table
    clinic1 = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic2 = Clinic.create!(name: 'jkdsjka', open: false, computers: 80)

    visit "/clinics/#{clinic1.id}"
    within "#clinic_details" do
      expect(page).to have_content("#{clinic1.id}")
    end

    visit "/clinics/#{clinic2.id}"
    within "#clinic_details" do
      expect(page).to have_content("#{clinic2.id}")
    end
  end
end
