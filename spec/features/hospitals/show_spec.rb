require 'rails_helper'

RSpec.describe "hospitals show page", type: :feature do
  describe 'show feature tests' do
    it "can see the hospitals table" do
      # User Story 2, Parent Show (x2)
      # As a visitor
      # When I visit '/parents/:id'
      # Then I see the parent with that id including the parent's attributes:
      # - data from each column that is on the parent table
      hospital_1 = Hospital.create!(id: 1, name: 'St. Lukes', max_capacity: false, beds: 300)
      hospital_2 = Hospital.create!(name: 'Aurora Medical Center', max_capacity: true, beds: 500)

      visit "/hospitals/#{hospital_1.id}"
      expect(page).to have_content("id: #{hospital_1.id}")

      visit "/hospitals/#{hospital_2.id}"
      expect(page).to have_content("id: #{hospital_2.id}")
    end

    it "can see the hospitals table with patient count" do
      # User Story 7, Parent Child Count (x2)
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
      expect(page).to have_content("id: #{hospital_1.id}")
      expect(page).to have_content("Patients: #{hospital_1.patients.count}")

      visit "/hospitals/#{hospital_2.id}"
      expect(page).to have_content("id: #{hospital_2.id}")
      expect(page).to have_content("Patients: #{hospital_2.patients.count}")
    end

    it "Has links to child index" do
      # User Story 8, Child Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Child Index
      hospital_1 = Hospital.create!(id: 1, name: 'St. Lukes', max_capacity: false, beds: 300)

      visit "/hospitals/#{hospital_1.id}"
      click_on "Patient Index"
      expect(current_path).to eq("/patients")
    end

    it "Has links to Parent index" do
      # User Story 9, Parent Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Parent Index
      hospital_1 = Hospital.create!(id: 1, name: 'St. Lukes', max_capacity: false, beds: 300)

      visit "/hospitals/#{hospital_1.id}"
      click_on "Hospital Index"
      expect(current_path).to eq("/hospitals")
    end

    it "Has links to Parent Child index" do
    # User Story 10, Parent Child Index Link
    #
    # As a visitor
    # When I visit a parent show page ('/parents/:id')
    # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
    hospital_1 = Hospital.create!(id: 1, name: 'St. Lukes', max_capacity: false, beds: 300)

    visit "/hospitals/#{hospital_1.id}"
    click_on "Hospital-Patient Index"
    expect(current_path).to eq("/hospitals/#{hospital_1.id}/patients")
    end

    it 'links to the edit page' do
    #   User Story 12, Parent Update (x2)
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info
    hospital = Hospital.create!(name: 'Georgetown Hospital')

    visit "/hospitals/#{hospital.id}"

    click_link "Update #{hospital.name}"

    expect(current_path).to eq("/hospitals/#{hospital.id}/edit")
    end

    it 'can edit the hospital' do
      hospital = Hospital.create!(name: 'Major Hospital')

      visit "/hospitals/#{hospital.id}"

      expect(page).to have_content('Major Hospital')

      click_link "Update #{hospital.name}"

      fill_in('Name', with: 'Major Grand Hospital')
      fill_in('max_capacity', with: 'true')
      fill_in('beds', with: '250')
      click_button 'Update Hospital'
      new_hospital_id = Hospital.last.id

      expect(current_path).to eq("/hospitals/#{hospital.id}")
      expect(page).to have_content('Major Grand Hospital')
      visit "/hospitals/#{new_hospital_id}"
      expect(page).to have_content('true')
    end
  end
end
