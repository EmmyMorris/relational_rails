require 'rails_helper'

RSpec.describe "clinic show page", type: :feature do
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
end
