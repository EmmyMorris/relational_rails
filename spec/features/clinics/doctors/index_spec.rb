require 'rails_helper'

RSpec.describe 'Clinics doctors index' do
  it 'shows all of the doctors associated with that Clinic with each Doctors attributes' do
    # User Story 5
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    brian = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    george = clinic.doctors.create!(name: 'George', available: true, rating: 3.0)

    visit "/clinics/#{clinic.id}/doctors"
    expect(page).to have_content(brian.name)
    expect(page).to have_content(george.name)
  end
end
