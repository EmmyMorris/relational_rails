require 'rails_helper'

RSpec.describe 'Clinics doctors index' do
  it 'shows all of the doctors associated with that Clinic with each Doctors attributes' do
    # User Story 5
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes:
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    brian = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    george = clinic.doctors.create!(name: 'George', available: true, rating: 3.0)

    visit "/clinics/#{clinic.id}/doctors"
    expect(page).to have_content(brian.name)
    expect(page).to have_content(george.name)
  end

  it "has links to doctor index" do
    # User Story 8
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    visit "/clinics/#{clinic.id}/doctors"

    click_on "Doctor Index"
    expect(current_path).to eq("/doctors")
  end

  it "has links to clinic index" do
    # User Story 9
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    visit "/clinics/#{clinic.id}/doctors"

    click_on "Clinic Index"
    expect(current_path).to eq("/clinics")
  end

  it "Orders doctors alphabetically" do
    # User Story 16, Sort Parent's Children in Alphabetical Order by name (x2)
    # As a visitor
    # When I visit the Parent's children Index Page
    # Then I see a link to sort children in alphabetical order
    # When I click on the link
    # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor_2 = clinic.doctors.create!(name: 'Larry', available: true, rating: 2.5)
    doctor_1 = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)


    visit "/clinics/#{clinic.id}/doctors"
    expect(page).to have_content(doctor_1.name)
    expect(page).to have_content(doctor_2.name)
    expect(doctor_2.name).to appear_before(doctor_1.name)

    click_on "Sort Alphabetically"
    expect(doctor_1.name).to appear_before(doctor_2.name)
  end

  it "has edit link next to doctors" do
    # User Story 18, Child Update From Childs Index Page (x1)
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to edit that child's info
    # When I click the link
    # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor_1 = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)

    visit "/clinics/#{clinic.id}/doctors"
    # save_and_open_page
    click_on "Edit Doctor #{doctor_1.name}"
    expect(current_path).to eq("/clinics/#{clinic.id}/doctors/#{doctor_1.id}/edit")
  end

  it 'can edit the doctor' do
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor_1 = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)

    visit "/clinics/#{clinic.id}/doctors"
    expect(page).to have_content('Brian')

    click_button "Edit Doctor #{doctor_1.name}"

    fill_in 'Name', with: 'Robert'
    fill_in 'Rating', with: '2.5'
    fill_in 'Available', with: 'true'

    click_button "Update Doctor"

    expect(current_path).to eq("/clinics/#{clinic.id}/doctors")
    expect(page).to have_content('Robert')
    expect(page).to have_content('2.5')
    expect(page).to have_content('true')
  end

  it 'displays records over given threshold' do
    # User Story 21, Display Records Over a Given Threshold (x2)
    # As a visitor
    # When I visit the Parent's children Index Page
    # I see a form that allows me to input a number value
    # When I input a number value and click the submit button that reads 'Only return records with more than `number` of `column_name`'
    # Then I am brought back to the current index page with only the records that meet that threshold shown.
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    doctor_2 = clinic.doctors.create!(name: 'George', available: true, rating: 1.5)
    doctor_3 = clinic.doctors.create!(name: 'Julie', available: true, rating: 2.5)

    visit "clinics/#{clinic.id}/doctors"
    expect(page).to have_content('Brian')
    expect(page).to have_content('George')
    expect(page).to have_content('Julie')

    fill_in '', with: '2.5'
    save_and_open_page
    click_button "Filter Doctors by Rating"

    expect(current_path).to eq("/clinics/#{clinic.id}/doctors")
    expect(page).to have_content('Brian')
    expect(page).not_to have_content('George')
    expect(page).not_to have_content('Julie')
    expect(page).to have_content('3.5')
    expect(page).to have_content('true')
  end
end
