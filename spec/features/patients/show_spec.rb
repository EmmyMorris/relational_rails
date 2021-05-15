require 'rails_helper'

RSpec.describe "patient index page", type: :feature do
  it "can see the patient_1" do
    # User Story 4, Child Show (x2)
    # As a visitor
    # When I visit '/child_table_name/:id'
    # Then I see the child with that id including the child's attributes:
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
    hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
    hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)

    hospital_2 = Hospital.create!(name: 'Crest Health', max_capacity: false, beds: 300)
    hospital_2.patients.create!(name: 'Megan', visitors: true, age: 31)
    hospital_2.patients.create!(name: 'Luke', visitors: false, age: 78)

    visit "/patients/#{hospital.patients.first.id}"
    expect(page).to have_content("id: #{hospital.patients.first.id}")

    visit "/patients/#{hospital.patients.second.id}"
    expect(page).to have_content("id: #{hospital.patients.second.id}")


    visit "/patients/#{hospital_2.patients.first.id}"
    expect(page).to have_content("id: #{hospital_2.patients.first.id}")

    visit "/patients/#{hospital_2.patients.second.id}"
    expect(page).to have_content("id: #{hospital_2.patients.second.id}")
  end

  it "Has links to child index" do
    # User Story 8, Child Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
    hospital.patients.create!(name: 'Miko', visitors: true, age: 37)

    visit "/patients/#{hospital.patients.first.id}"
    click_on "Patient Index"
    expect(current_path).to eq("/patients")
  end

  it "Has links to Parent index" do
    # User Story 9, Parent Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
    hospital.patients.create!(name: 'Miko', visitors: true, age: 37)

    visit "/patients/#{hospital.patients.first.id}"
    click_on "Hospital Index"
    expect(current_path).to eq("/hospitals")
  end
end
