require 'rails_helper'
RSpec.describe "the doctor edit" do
  it "has edit link next to doctors" do
    # User Story 18, Child Update From Childs Index Page (x1)
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to edit that child's info
    # When I click the link
    # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor_1 = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)

    visit "/clinics/#{clinic.id}/doctors"
    # save_and_open_page
    click_on "Edit Doctor #{doctor_1.name}"
    expect(current_path).to eq("/clinics/#{clinic.id}/doctors/#{doctor_1.id}/edit")
  end

  it 'can edit the doctor' do
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor_1 = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)

    visit "/clinics/#{clinic.id}/doctors"
    expect(page).to have_content('Brian')

    click_button "Edit Doctor #{doctor_1.name}"

    fill_in 'Name', with: 'Robert'
    fill_in 'Rating', with: '2.5'
    fill_in 'Available', with: 'true'

    click_button "Update Doctor"

    expect(current_path).to eq("/clinics/#{clinic.id}/doctors")
    expect(page).to have_content('Robert')
    expect(page).to have_content('2.5')
    expect(page).to have_content('true')
  end
end
