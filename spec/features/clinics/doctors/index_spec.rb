require 'rails_helper'

RSpec.describe 'Clinics doctors index' do
  it 'shows all of the doctors associated with that Clinic with each Doctors attributes' do
    # User Story 5
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    brian = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    george = clinic.doctors.create!(name: 'George', available: true, rating: 3.0)

    visit "/clinics/#{clinic.id}/doctors"
    expect(page).to have_content(brian.name)
    expect(page).to have_content(george.name)
  end

  it "has links to doctor index" do
    # User Story 8
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    visit "/clinics/#{clinic.id}/doctors"

    click_on "Doctor Index"
    expect(current_path).to eq("/doctors")
  end

  it "has links to clinic index" do
    # User Story 9
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    visit "/clinics/#{clinic.id}/doctors"

    click_on "Clinic Index"
    expect(current_path).to eq("/clinics")
  end

  it "Orders doctors alphabetically" do
    # User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)
    # As a visitor
    # When I visit the Parent's children Index Page
    # Then I see a link to sort children in alphabetical order
    # When I click on the link
    # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor_1 = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    doctor_2 = clinic.doctors.create!(name: 'Larry', available: true, rating: 2.5)


    visit "/clinics/#{clinic.id}/doctors"
    expect(page).to have_content(doctor_1.name)
    expect(page).to have_content(doctor_2.name)
    expect(doctor_1.name).to appear_before(doctor_2.name)
  end
end
