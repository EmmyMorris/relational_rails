require 'rails_helper'

RSpec.describe "clinics index page", type: :feature do
  it "can see all clinic names" do
    # User Story 1, Parent Index (x2)
    #
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    clinic1 = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic2 = Clinic.create!(name: 'jkdsjka', open: false, computers: 80)

    visit "/clinics"
    expect(page).to have_content(clinic1.name)
    expect(page).to have_content(clinic2.name)
  end
end
