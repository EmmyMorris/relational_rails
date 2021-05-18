require 'rails_helper'
RSpec.describe "the clinic edit" do
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

    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)

    visit '/clinics'

    click_button "Edit #{clinic.name}"

    expect(current_path).to eq("/clinics/#{clinic.id}/edit")
  end

  it 'can edit the clinic' do
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)

    visit '/clinics'

    expect(page).to have_content('First Priority')

    click_button 'Edit First Priority'

    fill_in('Name', with: 'UrgentCare')
    fill_in('open', with: 'true')
    fill_in('computers', with: '50')
    click_button 'Update Clinic'
    new_clinic_id = Clinic.last.id

    expect(current_path).to eq("/clinics")
    expect(page).to have_content('UrgentCare')
    visit "/clinics/#{new_clinic_id}"
    expect(page).to have_content('true')
  end
end
