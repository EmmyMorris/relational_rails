require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'relationships' do
    it {should belong_to :clinic}
  end

  describe 'class method test' do
    it "shows all the doctors that are available" do
      clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
      doctor_1 = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
      doctor_2 = clinic.doctors.create!(name: 'George', available: false, rating: 3.0)
      expect(Doctor.is_available).to eq([doctor_1])
    end

    it 'orders doctors alphabetically' do
      clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
      doctor_1 = clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
      doctor_2 = clinic.doctors.create!(name: 'George', available: false, rating: 3.0)

      expect(Doctor.order_alphabetically).to eq([doctor_1, doctor_2])
    end
  end
end
