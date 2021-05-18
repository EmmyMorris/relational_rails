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

  it "has links to doctor index" do
    # User Story 8
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    visit "/clinics"
    click_on "Doctor Index"
    expect(current_path).to eq("/doctors")
  end

  it "has links to clinic index" do
    # User Story 9
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    visit "/clinics"

    click_on "Clinic Index"
    expect(current_path).to eq("/clinics")
  end

  it "has edit link next to clinic" do
    # User Story 17, Parent Update From Parent Index Page (x2)
    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to edit that parent's info
    # When I click the link
    # I should be taken to that parents edit page where I can update its information just like in User Story 4
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)

    visit "/clinics"
    click_on "Edit #{clinic.name}"
    expect(current_path).to eq("/clinics/#{clinic.id}/edit")
  end
end
