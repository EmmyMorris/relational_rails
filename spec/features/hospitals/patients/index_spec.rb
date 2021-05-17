require 'rails_helper'

RSpec.describe "hospital patient index page", type: :feature do
  it "can see the patients for the hospital" do
    # User Story 5, Parent Children Index (x2)
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
    miko = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
    tyler = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)

    visit "/hospitals/#{hospital.id}/patients"
    expect(page).to have_content(miko.name)
  end
  it "Has links to child index" do
    # User Story 8, Child Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)

    visit "/hospitals/#{hospital.id}/patients"
    click_on "Patient Index"
    expect(current_path).to eq("/patients")
  end

  it "Has links to Parent index" do
    # User Story 9, Parent Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)

    visit "/hospitals/#{hospital.id}/patients"
    click_on "Hospital Index"
    expect(current_path).to eq("/hospitals")
  end

  it "Orders patients alphabetically" do
    # User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)
    # As a visitor
    # When I visit the Parent's children Index Page
    # Then I see a link to sort children in alphabetical order
    # When I click on the link
    # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
    miko = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
    tyler = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)


    visit "/hospitals/#{hospital.id}/patients"
    expect(page).to have_content(miko.name)
    expect(page).to have_content(tyler.name)
    expect(miko.name).to appear_before(tyler.name)
  end
end
