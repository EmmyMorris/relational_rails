require 'rails_helper'

RSpec.describe "clinics index page", type: :feature do
  it "can see all clinic names" do
    clinic1 = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic2 = Clinic.create!(name: 'jkdsjka', open: false, computers: 80)

    visit "/clinics"
    expect(page).to have_content(clinic1.name)
    expect(page).to have_content(clinic2.name)
  end

  it "can see the clinics table" do
    clinic1 = Clinic.create!(name: 'First Priority', open: false, computers: 80)
    clinic2 = Clinic.create!(name: 'jkdsjka', open: false, computers: 80)

    visit "/clinics/#{clinic1.id}"
    within "#clinic_details" do
      expect(page).to have_content("#{clinic1.id}")
    end

    visit "/clinics/#{clinic2.id}"
    within "#clinic_details" do
      expect(page).to have_content("#{clinic2.id}")
    end
  end
end
