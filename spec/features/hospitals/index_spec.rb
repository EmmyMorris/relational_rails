require 'rails_helper'

RSpec.describe "hospitals index page", type: :feature do
  describe 'index feature tests' do
    it "can see all hospital names" do
      hospital_1 = Hospital.create!(name: 'St. Johns', max_capacity: false, beds: 300)
      hospital_2 = Hospital.create!(name: 'Aurora Medical Center', max_capacity: false, beds: 300)

      visit "/hospitals"
      save_and_open_page
      expect(page).to have_content(hospital_1.name)
      expect(page).to have_content(hospital_2.name)
      Hospital.order('created_at DESC').all.should == [hospital_2, hospital_1]
      # expect(page).to have_content(
      expect(describe_class.for_ids_with_order([order.id])).to be_a(ActiveRecord::Relation)
      let!(:order) { create(:order) }
      let!(:other_order) { create(:order) }

      specify do
     expect(describe_class.for_ids_with_order([order.id])).to eq [order]
     expect(describe_class.for_ids_with_order([other_order.id])).to eq [other_order]
end
    end

    it "can see all hospital names" do
      hospital_1 = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
      hospital_2 = Hospital.create!(name: 'Aurora Medical Center', max_capacity: false, beds: 300)

      visit "/hospitals"
      # save_and_open_page
      expect(page).to have_content(hospital_1.name)
      expect(page).to have_content(hospital_2.name)
    end

    it "can see the hospitals table" do
      hospital_1 = Hospital.create!(id: 1, name: 'St. Lukes', max_capacity: false, beds: 300)
      hospital_2 = Hospital.create!(name: 'Aurora Medical Center', max_capacity: true, beds: 500)

      visit "/hospitals/#{hospital_1.id}"
      # save_and_open_page
      expect(page).to have_content("id: #{hospital_1.id}")

      visit "/hospitals/#{hospital_2.id}"
      # save_and_open_page
      expect(page).to have_content("id: #{hospital_2.id}")
    end
  end
end
