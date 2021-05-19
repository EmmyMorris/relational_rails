require 'rails_helper'

RSpec.describe "clinic destroy tests", type: :feature do
  it "can delete the clinic from the show page" do
    # User Story 19, Parent Delete (x2)
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to delete the parent
    # When I click the link "Delete Parent"
    # Then a 'DELETE' request is sent to '/parents/:id',
    # the parent is deleted, and all child records are deleted
    # and I am redirected to the parent index page where I no longer see this parent

    clinic_1 = Clinic.create!(name: 'First Priority', open: false, computers: 80)

    visit "/clinics/#{clinic_1.id}"
    click_on "Delete Clinic #{clinic_1.name}"

    expect(current_path).to eq ("/clinics")
    expect(page).not_to have_content('First Priority')
  end

  it "can delete the clinic from the index page" do
    # User Story 22, Parent Delete From Parent Index Page (x1)
    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to delete that parent
    # When I click the link
    # I am returned to the Parent Index Page where I no longer see that parent

    clinic_1 = Clinic.create!(name: 'First Priority', open: false, computers: 80)

    visit "/clinics"
    click_on "Delete Clinic #{clinic_1.name}"

    expect(current_path).to eq ("/clinics")
    expect(page).not_to have_content('First Priority')
  end
end
