require 'rails_helper'

RSpec.describe "patientss index page", type: :feature do
  it "can see all patients" do
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
    hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
    hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)

    hospital_2 = Hospital.create!(name: 'Crest Health', max_capacity: false, beds: 300)
    hospital_2.patients.create!(name: 'Megan', visitors: true, age: 31)
    hospital_2.patients.create!(name: 'Luke', visitors: false, age: 78)


    visit "/patients"
    save_and_open_page
    expect(page).to have_content("#{hospital.patients.first.name}")
    expect(page).to have_content("#{hospital.patients.second.name}")
    expect(page).to have_content("#{hospital_2.patients.first.name}")
    expect(page).to have_content("#{hospital_2.patients.second.name}")
    # expect(page).to have_content(hospital_2.patients)
  end
end
