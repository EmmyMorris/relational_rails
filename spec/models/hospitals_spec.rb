require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'relationships' do
    it {should have_many :patients}
  end

  describe "class method test" do
    it 'orders hospitals by created at' do
      hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
      hospital_2 = Hospital.create!(name: 'Crest Health', max_capacity: false, beds: 300)
      hospital_3 = Hospital.create!(name: 'Moon Crest', max_capacity: true, beds: 800)

      expect(Hospital.order_by_created_at).to eq([hospital_3, hospital_2, hospital])
    end
  end
end
