require 'rails_helper'
RSpec.describe "the hospital edit" do
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

   visit '/hospitals'

   click_button "Edit #{hospital.name}"

   expect(current_path).to eq("/hospitals/#{hospital.id}/edit")
  end
  
  it 'can edit the artist' do
    hospital = Hospital.create!(name: 'Major Hospital')

    visit '/hospitals'

    expect(page).to have_content('Major Hospital')

    click_button 'Edit Major Hospital'

    fill_in 'Name', with: 'Major Grand Hospital'
    click_button 'Update Hospital'

    expect(current_path).to eq("/hospitals")
    expect(page).to have_content('Major Grand Hospital')
  end
end
