require 'rails_helper'

RSpec.describe "hospitals show page", type: :feature do
  describe 'show feature tests' do
    it "can see the hospitals table" do
      # User Story 2, Parent Show (x2)
      #
      # As a visitor
      # When I visit '/parents/:id'
      # Then I see the parent with that id including the parent's attributes:
      # - data from each column that is on the parent table
      hospital_1 = Hospital.create!(id: 1, name: 'St. Lukes', max_capacity: false, beds: 300)
      hospital_2 = Hospital.create!(name: 'Aurora Medical Center', max_capacity: true, beds: 500)

      visit "/hospitals/#{hospital_1.id}"
      # save_and_open_page
      expect(page).to have_content("id: #{hospital_1.id}")

      visit "/hospitals/#{hospital_2.id}"
      # save_and_open_page
      expect(page).to have_content("id: #{hospital_2.id}")
    end

    it "can see the hospitals table with patient count" do
      # User Story 7, Parent Child Count (x2)
      #
      # As a visitor
      # When I visit a parent's show page
      # I see a count of the number of children associated with this parent
      hospital_1 = Hospital.create!(id: 1, name: 'St. Lukes', max_capacity: false, beds: 300)
      hospital_2 = Hospital.create!(name: 'Aurora Medical Center', max_capacity: true, beds: 500)
      miko = hospital_1.patients.create!(name: 'Miko', visitors: true, age: 37)
      tyler = hospital_1.patients.create!(name: 'Tyler', visitors: false, age: 20)
      roger = hospital_1.patients.create!(name: 'Roger', visitors: true, age: 50)
      megan = hospital_2.patients.create!(name: 'Megan', visitors: true, age: 31)
      luke = hospital_2.patients.create!(name: 'Luke', visitors: false, age: 78)

      visit "/hospitals/#{hospital_1.id}"
      save_and_open_page
      expect(page).to have_content("id: #{hospital_1.id}")
      expect(page).to have_content("Patients: #{hospital_1.patients.count}")

      visit "/hospitals/#{hospital_2.id}"
      save_and_open_page
      expect(page).to have_content("id: #{hospital_2.id}")
      expect(page).to have_content("Patients: #{hospital_2.patients.count}")
    end
  end
end
