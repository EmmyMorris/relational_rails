require 'rails_helper'

RSpec.describe "clinics index page", type: :feature do
  it "can see all clinic names" do
    # User Story 1
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
    clinic_1 = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic_2 = Clinic.create!(name: 'jkdsjka', open: false, computers: 80)

    visit "/clinics"
    expect(page).to have_content(clinic_1.name)
    expect(page).to have_content(clinic_2.name)
  end

  it "can see the clinic names ordered by most recently created first" do
    #User Story 6
    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created
    clinic_1 = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic_2 = Clinic.create!(name: 'jkdsjka', open: false, computers: 80)

    visit "/clinics"
    expect(page).to have_content(clinic_1.name)
    expect(page).to have_content(clinic_2.name)
    expect(clinic_2.name).to appear_before(clinic_1.name)
  end
end
