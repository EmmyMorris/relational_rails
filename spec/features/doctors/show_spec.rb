require 'rails_helper'

RSpec.describe "doctors show page", type: :feature do
  it 'can see the doctor with the id including its attributes' do
    # User Story 4
    # As a visitor
    # When I visit '/child_table_name/:id'
    # Then I see the child with that id including the child's attributes:
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic_2 = Clinic.create!(name: 'Medical Plus', open: true, computers: 100)

    clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    clinic_2.doctors.create!(name: 'Jamison', available: false, rating: 4.7)

    clinic.doctors.create!(name: 'George', available: true, rating: 3.0)
    clinic_2.doctors.create!(name: 'Leah', available: false, rating: 2.5)

    visit "/doctors/#{clinic.doctors.first.id}"
    expect(page).to have_content("#{clinic.doctors.first.id}")
    visit "/doctors/#{clinic.doctors.second.id}"
    expect(page).to have_content("#{clinic.doctors.second.id}")

    visit "/doctors/#{clinic_2.doctors.first.id}"
    expect(page).to have_content("#{clinic_2.doctors.first.id}")
    visit "/doctors/#{clinic_2.doctors.second.id}"
    expect(page).to have_content("#{clinic_2.doctors.second.id}")
  end
end
