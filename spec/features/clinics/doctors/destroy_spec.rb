require 'rails_helper'

RSpec.describe 'Clinics doctors destroy' do
  it "can delete the doctor from the clinic-doctor index page" do
    # User Story 23, Child Delete From Childs Index Page (x1)
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to delete that child
    # When I click the link
    # I should be taken to the `child_table_name` index page where I no longer see that child

    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)

    visit "/clinics/#{clinic.id}/doctors"
    click_on "Delete Doctor #{doctor.name}"

    expect(current_path).to eq ("/clinics/#{clinic.id}/doctors")
    expect(page).not_to have_content('Brian')
  end
end
