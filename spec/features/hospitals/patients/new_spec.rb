require 'rails_helper'
RSpec.describe "Child creation" do
  it  'links to the new page from the Patient index' do
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
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)

    visit "/hospitals/#{hospital.id}/patients"
    click_link('Create Patient')
    expect(current_path).to eq("/hospitals/#{hospital.id}/patients/new")
  end

  it 'can create a new hospital' do
    hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)

    visit "/hospitals/#{hospital.id}/patients/new"
    fill_in('name', with: 'Carlos')
    # fill_in('Visitors', with: true)
    fill_in('age', with: '40')
    click_button('Create Patient')
    # save_and_open_page
    new_patient_id = Patient.last.id
    expect(current_path).to eq("/hospitals/#{hospital.id}/patients")
    expect(page).to have_content("Carlos")
    # expect(page).to have_content("true")
  end
end
