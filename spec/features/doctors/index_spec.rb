require 'rails_helper'

RSpec.describe "doctors index page", type: :feature do
  it 'can see each doctor in the system' do
    # User Story 3
    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic_2 = Clinic.create!(name: 'Medical Plus', open: true, computers: 100)
    clinic_3 = Clinic.create!(name: 'Healing Helpers', open: true, computers: 70)

    clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    clinic_2.doctors.create!(name: 'Jamison', available: false, rating: 4.7)
    clinic_3.doctors.create!(name: 'Ian', available: true, rating: 4.0)

    clinic.doctors.create!(name: 'George', available: true, rating: 3.0)
    clinic_2.doctors.create!(name: 'Leah', available: false, rating: 2.5)
    clinic_3.doctors.create!(name: 'Thomas', available: true, rating: 1.5)

    visit '/doctors'
    expect(page).to have_content("#{clinic.doctors.first.name}")
    expect(page).to have_content("#{clinic.doctors.second.name}")
    expect(page).not_to have_content("#{clinic_2.doctors.first.name}")
    expect(page).not_to have_content("#{clinic_2.doctors.second.name}")
    expect(page).to have_content("#{clinic_3.doctors.first.name}")
    expect(page).to have_content("#{clinic_3.doctors.second.name}")
  end

  it "has links to doctor index" do
    # User Story 8
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    visit "/doctors"
    click_on "Doctor Index"
    expect(current_path).to eq("/doctors")
  end

  it "has links to clinic index" do
    # User Story 9
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Parent Index
    visit "/doctors"

    click_on "Clinic Index"
    expect(current_path).to eq("/clinics")
  end

  it "Has only true visitors" do
    # User Story 15, Child Index only shows `true` Records (x2)
    #
    # As a visitor
    # When I visit the child index
    # Then I only see records where the boolean column is `true`
    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic_2 = Clinic.create!(name: 'Medical Plus', open: true, computers: 100)
    clinic_3 = Clinic.create!(name: 'Healing Helpers', open: true, computers: 70)

    clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
    clinic_2.doctors.create!(name: 'Jamison', available: false, rating: 4.7)
    clinic_3.doctors.create!(name: 'Ian', available: true, rating: 4.0)

    clinic.doctors.create!(name: 'George', available: true, rating: 3.0)
    clinic_2.doctors.create!(name: 'Leah', available: false, rating: 2.5)
    clinic_3.doctors.create!(name: 'Thomas', available: true, rating: 1.5)

    visit "/doctors"
    expect(page).to have_content('Brian')
    expect(page).to have_content('Ian')
    expect(page).to have_content('true')
    expect(page).not_to have_content('Jamison')
    expect(page).not_to have_content('Leah')
    expect(page).not_to have_content('false')
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

    visit "/doctors"
    click_on "Update Doctor #{doctor_1.name}"
    expect(current_path).to eq("/doctors/#{doctor_1.id}/edit")
  end
end
