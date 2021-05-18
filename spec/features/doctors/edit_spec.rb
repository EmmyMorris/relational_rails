require 'rails_helper'
RSpec.describe "the doctor edit" do
  it 'links to the edit page' do
    # User Story 14, Child Update (x2)
    # As a visitor
    # When I visit a Child Show page
    # Then I see a link to update that Child "Update Child"
    # When I click the link
    # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
    # When I click the button to submit the form "Update Child"
    # Then a `PATCH` request is sent to '/child_table_name/:id',
    # the child's data is updated,
    # and I am redirected to the Child Show page where I see the Child's updated information
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)

    visit '/doctors'
    click_button "Update Doctor #{doctor.name}"
    expect(current_path).to eq("/doctors/#{doctor.id}/edit")
  end

  it 'can edit the doctor' do
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)

    visit '/doctors'
    expect(page).to have_content('Brian')

    click_button "Update Doctor Brian"

    fill_in 'Name', with: 'Larry'
    fill_in 'Rating', with: '4.1'
    fill_in 'Available', with: 'true'

    click_button 'Update Doctor'

    expect(current_path).to eq("/doctors")
    expect(page).to have_content('Larry')
    expect(page).to have_content('4.1')
    expect(page).to have_content('true')
  end
end
