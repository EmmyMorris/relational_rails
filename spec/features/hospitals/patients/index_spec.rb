require 'rails_helper'

RSpec.describe "hospital patient index page", type: :feature do
  it "can see the patients for the hospital" do
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
    miko = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
    tyler = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)

    visit "/hospitals/#{hospital.id}/patients"
    save_and_open_page
    expect(page).to have_content(miko.name)
  end

  # it "can see the patients for the hospital"
  #   hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
  #   miko = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
  #   tyler = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)
  #
  #   visit "/hospitals/#{hospital.id}/patients"
  #   click_on
  #   expect(page).to have_content(miko.name)

end
