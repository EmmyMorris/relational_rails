require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it {should belong_to :hospital}
  end

  describe 'class method test' do
    it "shows all the patients with visitors" do
      hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
      patient_1 = hospital.patients.create!(name: 'Miley', visitors: true, age: 37)
      patient_2 = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)
      expect(Patient.has_visitors).to eq([patient_1])
    end

    it 'orders patients alphabetically' do
      hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
      patient_1 = hospital.patients.create!(name: 'Miley', visitors: true, age: 37)
      patient_2 = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)

      expect(Patient.order_alphabetically).to eq([patient_1, patient_2])
    end

    it 'filters patients by age' do
      hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
      patient_1 = hospital.patients.create!(name: 'Miley', visitors: true, age: 37)
      patient_2 = hospital.patients.create!(name: 'Tyler', visitors: false, age: 20)

      expect(Patient.filter_by_age(20)).to eq([patient_1])
    end
  end
end
