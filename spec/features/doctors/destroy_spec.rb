require 'rails_helper'

RSpec.describe "doctor show page", type: :feature do
  it "can delete the doctor from the show page" do
    # User Story 20, Child Delete (x2)
    # As a visitor
    # When I visit a child show page
    # Then I see a link to delete the child "Delete Child"
    # When I click the link
    # Then a 'DELETE' request is sent to '/child_table_name/:id',
    # the child is deleted,
    # and I am redirected to the child index page where I no longer see this child

    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)

    visit "/doctors/#{doctor.id}"
    click_on "Delete Doctor #{doctor.name}"

    expect(current_path).to eq ("/doctors")
    expect(page).not_to have_content('Brian')
  end

  it "can delete the doctor from the index page" do
    # User Story 23, Child Delete From Childs Index Page (x1)
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to delete that child
    # When I click the link
    # I should be taken to the `child_table_name` index page where I no longer see that child

    clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    doctor = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)

    visit "/doctors"
    click_on "Delete Doctor #{doctor.name}"

    expect(current_path).to eq ("/doctors")
    expect(page).not_to have_content('Brian')
  end
end
