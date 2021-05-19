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
    tyler = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)
    miko = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)


    visit "/hospitals/#{hospital.id}/patients"
    expect(page).to have_content(miko.name)
    expect(page).to have_content(tyler.name)
    expect(tyler.name).to appear_before(miko.name)

    click_on "Sort Alphabetically"
    expect(miko.name).to appear_before(tyler.name)
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

    visit "/hospitals/#{hospital.id}/patients"
    # save_and_open_page
    click_on "Edit Patient #{patient_1.name}"
    expect(current_path).to eq("/hospitals/#{hospital.id}/patients/#{patient_1.id}/edit")
  end

  it 'can edit the patient' do
    hospital = Hospital.create!(name: 'St. Johns', max_capacity: false, beds: 300)
    patient_1 = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)

    visit "/hospitals/#{hospital.id}/patients"
    expect(page).to have_content('Miko')

    click_button "Edit Patient #{patient_1.name}"

    fill_in 'Name', with: 'Robert'
    fill_in 'Age', with: '77'
    fill_in 'Visitors', with: 'true'

    click_button "Update Patient"

    expect(current_path).to eq("/hospitals/#{hospital.id}/patients")
    expect(page).to have_content('Robert')
    expect(page).to have_content('77')
    expect(page).to have_content('true')
  end

  it 'displays records over given threshold' do
    # User Story 21, Display Records Over a Given Threshold (x2)
    # As a visitor
    # When I visit the Parent's children Index Page
    # I see a form that allows me to input a number value
    # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
    # Then I am brought back to the current index page with only the records that meet that threshold shown.
    hospital = Hospital.create!(name: 'St. Johns', max_capacity: false, beds: 300)
    miko = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
    tyler = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)

    visit "hospitals/#{hospital.id}/patients"
    expect(page).to have_content('Miko')
    expect(page).to have_content('Tyler')

    fill_in 'Filter by age', with: '30'
    
    click_button "Filter Patients by Age"

    expect(current_path).to eq("/hospitals/#{hospital.id}/patients")
    expect(page).to have_content('Miko')
    expect(page).not_to have_content('Tyler')
    expect(page).to have_content('37')
    expect(page).to have_content('true')
  end
end
