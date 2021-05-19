require 'rails_helper'

RSpec.describe "Destroy a patient", type: :feature do
  describe 'index feature tests' do
    it "can delete a patient" do
      # User Story 20, Child Delete (x2)
      # As a visitor
      # When I visit a child show page
      # Then I see a link to delete the child "Delete Child"
      # When I click the link
      # Then a 'DELETE' request is sent to '/child_table_name/:id',
      # the child is deleted,
      # and I am redirected to the child index page where I no longer see this child
      hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
      patient_1 = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)

      visit "/patients/#{patient_1.id}"
      click_link "Delete Patient #{patient_1.name}"
      expect(current_path).to eq("/patients")
      expect(page).not_to have_content("Miko")
    end

    it "can delete a patient from index page" do
      # User Story 23, Child Delete From Childs Index Page (x1)
      # As a visitor
      # When I visit the `child_table_name` index page or a parent `child_table_name` index page
      # Next to every child, I see a link to delete that child
      # When I click the link
      # I should be taken to the `child_table_name` index page where I no longer see that child

      hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
      patient_1 = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)

      visit "/patients"
      click_link "Delete Patient #{patient_1.name}"
      expect(current_path).to eq("/patients")
      expect(page).not_to have_content("Miko")
    end
  end
end
