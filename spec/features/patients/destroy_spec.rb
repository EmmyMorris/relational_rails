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
  end
end
