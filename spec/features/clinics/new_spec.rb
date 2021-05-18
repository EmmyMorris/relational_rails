require 'rails_helper'
RSpec.describe "parent creation" do
  it  'links to the new page from the clinic index' do
    # User Story 11, Parent Creation (x2)
    # As a visitor
    # When I visit the Parent Index page
    # Then I see a link to create a new Parent record, "New Parent"
    # When I click this link
    # Then I am taken to '/parents/new' where I  see a form for a new parent record
    # When I fill out the form with a new parent's attributes:
    # And I click the button "Create Parent" to submit the form
    # Then a `POST` request is sent to the '/parents' route,
    # a new parent record is created,
    # and I am redirected to the Parent Index page where I see the new Parent displayed.

    visit '/clinics'
    click_link('New Clinic')
    expect(current_path).to eq('/clinics/new')
  end
  it 'can create a new clinic' do
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    visit '/clinics/new'

    fill_in('name', with: 'UrgentCare')
    fill_in('open', with: 'true')
    fill_in('computers', with: '20')
    click_button('Create Clinic')
    # save_and_open_page
    new_clinic_id = Clinic.last.id
    expect(current_path).to eq("/clinics")
    expect(page).to have_content("UrgentCare")

    visit "/clinics/#{new_clinic_id}"
    expect(page).to have_content('true')
   end
end
