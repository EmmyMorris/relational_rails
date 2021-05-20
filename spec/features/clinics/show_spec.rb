require 'rails_helper'

RSpec.describe "clinics show page", type: :feature do
  it "can see the clinics table" do
    # User Story 2
    # As a visitor
    # When I visit '/parents/:id'
    # Then I see the parent with that id including the parent's attributes:
    # - data from each column that is on the parent table
    clinic_1 = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic_2 = Clinic.create!(name: 'jkdsjka', open: false, computers: 80)

    visit "/clinics/#{clinic_1.id}"
    expect(page).to have_content("#{clinic_1.id}")

    visit "/clinics/#{clinic_2.id}"
    expect(page).to have_content("#{clinic_2.id}")
  end

  it "can see the doctors associated with the clinic" do
    # User Story 7
    # As a visitor
    # When I visit a parent's show page
    # I see a count of the number of children associated with this parent
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    brian = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    george = clinic.doctors.create!(name: 'George', available: true, rating: 3.0)

    visit "/clinics/#{clinic.id}"
    expect(page).to have_content(clinic.id)
    expect(page).to have_content(clinic.doctors.count)
  end

  it "has links to doctor index" do
    # User Story 8
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    visit "/clinics/#{clinic.id}"

    click_on "Doctor Index"
    expect(current_path).to eq("/doctors")
  end

  it "has links to clinic index" do
    # User Story 9
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    visit "/clinics/#{clinic.id}"

    click_on "Clinic Index"
    expect(current_path).to eq("/clinics")
  end

  it "has links to Clinic-Doctor index" do
    # User Story 10
    # As a visitor
    # When I visit a parent show page ('/parents/:id')
    # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    visit "/clinics/#{clinic.id}"

    click_on "Doctors at #{clinic.name}"
    expect(current_path).to eq("/clinics/#{clinic.id}/doctors")
  end

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

    visit "/clinics/#{clinic.id}"

    click_link "Update #{clinic.name}"

    expect(current_path).to eq("/clinics/#{clinic.id}/edit")
  end

  it 'can edit the clinic' do
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)

    visit "/clinics/#{clinic.id}"

    expect(page).to have_content('First Priority')

    click_link 'Update First Priority'

    fill_in('Name', with: 'UrgentCare')
    fill_in('open', with: 'true')
    fill_in('computers', with: '50')
    click_button 'Update Clinic'
    new_clinic_id = Clinic.last.id

    expect(current_path).to eq("/clinics/#{clinic.id}")
    expect(page).to have_content('UrgentCare')
    visit "/clinics/#{new_clinic_id}"
    expect(page).to have_content('true')
  end
end
