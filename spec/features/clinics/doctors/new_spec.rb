require 'rails_helper'
RSpec.describe "Child creation" do
  it  'links to the new page from the doctor index' do
    #User Story 13, Parent Child Creation (x2)
    # As a visitor
    # When I visit a Parent Childs Index page
    # Then I see a link to add a new adoptable child for that parent "Create Child"
    # When I click the link
    # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
    # When I fill in the form with the child's attributes:
    # And I click the button "Create Child"
    # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
    # a new child object/row is created for that parent,
    # and I am redirected to the Parent Childs Index page where I can see the new child listed
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)

    visit "/clinics/#{clinic.id}/doctors"
    click_link('Create Doctor')
    expect(current_path).to eq("/clinics/#{clinic.id}/doctors/new")
  end

  it 'can create a new doctor' do
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)

    visit "/clinics/#{clinic.id}/doctors/new"
    fill_in('name', with: 'Carlos')
    fill_in('available', with: 'true')
    fill_in('rating', with: '2.0')
    click_button('Create Doctor')
    new_doctor_id = Doctor.last.id
    expect(current_path).to eq("/clinics/#{clinic.id}/doctors")
    expect(page).to have_content("Carlos")
    expect(page).to have_content("true")
    expect(page).to have_content("2.0")
  end
end
