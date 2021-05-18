require 'rails_helper'

RSpec.describe "doctors show page", type: :feature do
  it 'can see the doctor with the id including its attributes' do
    # User Story 4
    # As a visitor
    # When I visit '/child_table_name/:id'
    # Then I see the child with that id including the child's attributes:
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic_2 = Clinic.create!(name: 'Medical Plus', open: true, computers: 100)

    clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    clinic_2.doctors.create!(name: 'Jamison', available: false, rating: 4.7)

    clinic.doctors.create!(name: 'George', available: true, rating: 3.0)
    clinic_2.doctors.create!(name: 'Leah', available: false, rating: 2.5)

    visit "/doctors/#{clinic.doctors.first.id}"
    expect(page).to have_content("#{clinic.doctors.first.id}")
    visit "/doctors/#{clinic.doctors.second.id}"
    expect(page).to have_content("#{clinic.doctors.second.id}")

    visit "/doctors/#{clinic_2.doctors.first.id}"
    expect(page).to have_content("#{clinic_2.doctors.first.id}")
    visit "/doctors/#{clinic_2.doctors.second.id}"
    expect(page).to have_content("#{clinic_2.doctors.second.id}")
  end

  it "has links to doctor index" do
    # User Story 8
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    clinic.doctors.create!(name: 'George', available: true, rating: 3.0)
    visit "/doctors/#{clinic.doctors.first.id}"

    click_on "Doctor Index"
    expect(current_path).to eq("/doctors")
  end

  it "has links to clinic index" do
    # User Story 9
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    clinic.doctors.create!(name: 'George', available: true, rating: 3.0)
    visit "/doctors/#{clinic.doctors.first.id}"

    click_on "Clinic Index"
    expect(current_path).to eq("/clinics")
  end

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

    visit "/doctors/#{doctor.id}"
    click_link "Update Doctor #{doctor.name}"
    expect(current_path).to eq("/doctors/#{doctor.id}/edit")
  end

  it 'can edit the doctor' do
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)

    visit "/doctors/#{doctor.id}"
    expect(page).to have_content('Brian')

    click_link "Update Doctor Brian"

    fill_in 'Name', with: 'Larry'
    fill_in 'Rating', with: '4.1'
    fill_in 'Available', with: 'true'

    click_button 'Update Doctor'

    expect(current_path).to eq("/doctors/#{doctor.id}")
    expect(page).to have_content('Larry')
    expect(page).to have_content('4.1')
    expect(page).to have_content('true')
  end
end
