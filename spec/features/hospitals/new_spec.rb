require 'rails_helper'
RSpec.describe "parent creation" do
  it  'links to the new page from the hospital index' do
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
    visit '/hospitals'
    click_link('New Hospital')
    expect(current_path).to eq('/hospitals/new')
  end

  it 'can create a new hospital' do
    hospital = Hospital.create!(name: 'Major Hospital')
    visit '/hospitals/new'

    fill_in('name', with: 'Ryker')
    fill_in('max_capacity', with: 'true')
    fill_in('beds', with: '250')
    click_button('Create Hospital')
    # save_and_open_page
    new_hospital_id = Hospital.last.id
    expect(current_path).to eq("/hospitals")
    expect(page).to have_content("Ryker")

    visit "/hospitals/#{new_hospital_id}"
    expect(page).to have_content('true')
   end
end
