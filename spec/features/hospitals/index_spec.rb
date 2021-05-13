require 'rails_helper'

RSpec.describe "hospitals index page", type: :feature do
  it "can see all hospital names" do
    hospital1 = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
    hospital2 = Hospital.create!(name: 'cdskjl', max_capacity: false, beds: 300)

    visit "/hospitals"
    expect(page).to have_content(hospital1.name)
    expect(page).to have_content(hospital2.name)
  end

  it "can see the hospitals table" do
    hospital1 = Hospital.create!(id: 1, name: 'St. Lukes', max_capacity: false, beds: 300)
    hospital2 = Hospital.create!(name: 'cdskjl', max_capacity: true, beds: 500)

    visit "/hospitals/#{hospital1.id}"
    within "#hospital_details" do
      save_and_open_page
      expect(page).to have_content("id: #{hospital1.id}")
    end
  end
end
