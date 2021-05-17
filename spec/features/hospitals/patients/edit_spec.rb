require 'rails_helper'
RSpec.describe "the patient edit" do
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
end
