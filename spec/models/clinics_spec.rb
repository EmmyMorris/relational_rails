require 'rails_helper'

RSpec.describe Clinic, type: :model do
  describe 'relationships' do
    it {should have_many :doctors}
  end

  describe "class method test" do
    it 'orders clinics by created at' do
      clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
      clinic_2 = Clinic.create!(name: 'Medical Plus', open: true, computers: 100)
      clinic_3 = Clinic.create!(name: 'Healing Helpers', open: true, computers: 70)

      expect(Clinic.order_by_created_at).to eq([clinic_3, clinic_2, clinic])
    end
  end

  describe 'destroy' do
    clinic_4 = Clinic.create!(name: 'Mass General', open: false, computers: 80)
    clinic_4.destroy
    it {expect(clinic_4).to have_many(:doctors).dependent(:delete_all)}
  end
end
