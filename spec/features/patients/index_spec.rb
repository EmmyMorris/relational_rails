require 'rails_helper'

RSpec.describe "patients index page", type: :feature do
  it "can see all patients" do
    # User Story 3, Child Index (x2)
    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
    hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
    hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)

    hospital_2 = Hospital.create!(name: 'Crest Health', max_capacity: false, beds: 300)
    hospital_2.patients.create!(name: 'Megan', visitors: true, age: 31)
    hospital_2.patients.create!(name: 'Luke', visitors: false, age: 78)

    visit "/patients"
    expect(page).to have_content("#{hospital.patients.first.name}")
    expect(page).not_to have_content("#{hospital.patients.second.name}")
    expect(page).to have_content("#{hospital_2.patients.first.name}")
    expect(page).not_to have_content("#{hospital_2.patients.second.name}")
  end

  it "Has links to child index" do
    # User Story 8, Child Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    visit "/patients"
    click_on "Patient Index"
    expect(current_path).to eq("/patients")
  end

  it "Has links to Parent index" do
    # User Story 9, Parent Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    visit "/patients"
    click_on "Hospital Index"
    expect(current_path).to eq("/hospitals")
  end

  it "Has only true visitors" do
    # User Story 15, Child Index only shows `true` Records (x2)
    #
    # As a visitor
    # When I visit the child index
    # Then I only see records where the boolean column is `true`
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
    hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
    hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)

    hospital_2 = Hospital.create!(name: 'Crest Health', max_capacity: false, beds: 300)
    hospital_2.patients.create!(name: 'Megan', visitors: true, age: 31)
    hospital_2.patients.create!(name: 'Luke', visitors: false, age: 78)
    visit "/patients"
    expect(page).to have_content('Miko')
    expect(page).to have_content('Megan')
    expect(page).to have_content('true')
    expect(page).not_to have_content('Luke')
    expect(page).not_to have_content('Tyler')
    expect(page).not_to have_content('false')
  end

  it "has edit link next to patients" do
    # User Story 18, Child Update From Childs Index Page (x1)
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to edit that child's info
    # When I click the link
    # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
    hospital = Hospital.create!(name: 'St. Johns', max_capacity: false, beds: 300)
    patient_1 = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)

    visit "/patients"
    click_on "Update Patient #{patient_1.name}"
    expect(current_path).to eq("/patients/#{patient_1.id}/edit")
  end
end
