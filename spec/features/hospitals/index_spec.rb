require 'rails_helper'

RSpec.describe "hospitals index page", type: :feature do
  describe 'index feature tests' do
    it "can see all hospital names" do
      # User Story 1, Parent Index (x2)
      #
      # For each parent table
      # As a visitor
      # When I visit '/parents'
      # Then I see the name of each parent record in the system
      hospital_1 = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
      hospital_2 = Hospital.create!(name: 'Aurora Medical Center', max_capacity: false, beds: 300)

      visit "/hospitals"
      # save_and_open_page
      expect(page).to have_content(hospital_1.name)
      expect(page).to have_content(hospital_2.name)
    end
    
  it "can see the hospitals table" do
    # User Story 2, Parent Show (x2)
    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes:
    # - data from each column that is on the parent table
    hospital1 = Hospital.create!(id: 1, name: 'St. Lukes', max_capacity: false, beds: 300)
    hospital2 = Hospital.create!(name: 'cdskjl', max_capacity: true, beds: 500)

    visit "/hospitals/#{hospital1.id}"
    within "#hospital_details" do
    expect(page).to have_content("id: #{hospital1.id}")
    end
    
   it "can see all hospital names in order of created_at" do
      # User Story 6, Parent Index sorted by Most Recently Created (x2)
      # As a visitor
      # When I visit the parent index,
      # I see that records are ordered by most recently created first
      # And next to each of the records I see when it was created
      hospital_1 = Hospital.create!(name: 'St. Johns', max_capacity: false, beds: 300)
      hospital_2 = Hospital.create!(name: 'Aurora Medical Center', max_capacity: false, beds: 300)

      visit "/hospitals"
      # save_and_open_page
      expect(page).to have_content(hospital_1.name)
      expect(page).to have_content(hospital_2.name)
      expect(hospital_2.name).to appear_before(hospital_1.name)
   end
  end
end
