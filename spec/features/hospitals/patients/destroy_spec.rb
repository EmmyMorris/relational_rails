require 'rails_helper'

RSpec.describe "Destroy a patient", type: :feature do
  describe 'index feature tests' do
    it "can delete a patient" do
      # User Story 23, Child Delete From Childs Index Page (x1)
      # As a visitor
      # When I visit the `child_table_name` index page or a parent `child_table_name` index page
      # Next to every child, I see a link to delete that child
      # When I click the link
      # I should be taken to the `child_table_name` index page where I no longer see that child
      hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
      miko = hospital.patients.create!(name: 'Miko', visitors: true, age: 37)
      tyler = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)

      visit "/hospitals/#{hospital.id}/patients"
      click_link "Delete Patient #{miko.name}"
      expect(current_path).to eq("/hospitals/#{hospital.id}/patients")
      expect(page).not_to have_content("Miko")
    end
  end
end
