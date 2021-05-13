require 'rails_helper'

RSpec.describe "doctors index page", type: :feature do
  it 'can see each doctor in the system' do
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic_2 = Clinic.create!(name: 'Medical Plus', open: true, computers: 100)
    clinic_3 = Clinic.create!(name: 'Healing Helpers', open: true, computers: 70)

    clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    clinic_2.doctors.create!(name: 'Jamison', available: false, rating: 4.7)
    clinic_3.doctors.create!(name: 'Ian', available: true, rating: 4.0)

    clinic.doctors.create!(name: 'George', available: true, rating: 3.0)
    clinic_2.doctors.create!(name: 'Leah', available: false, rating: 2.5)
    clinic_3.doctors.create!(name: 'Thomas', available: true, rating: 1.5)

    visit '/doctors'
    save_and_open_page
    expect(page).to have_content("#{clinic.doctors.first.name}")
    expect(page).to have_content("#{clinic.doctors.second.name}")
    expect(page).to have_content("#{clinic_2.doctors.first.name}")
    expect(page).to have_content("#{clinic_2.doctors.second.name}")
    expect(page).to have_content("#{clinic_3.doctors.first.name}")
    expect(page).to have_content("#{clinic_3.doctors.second.name}")
  end
end
