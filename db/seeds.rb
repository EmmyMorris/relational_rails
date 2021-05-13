# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
hospital_2 = Hospital.create!(name: 'Sky Ridge', max_capacity: true, beds: 200)
hospital_3 = Hospital.create!(name: 'Denver Health', max_capacity: false, beds: 600)

hospital.patients.create!(name: 'Mike', visitors: true, age: 37)
hospital_2.patients.create!(name: 'Megan', visitors: true, age: 31)
hospital_3.patients.create!(name: 'Bob', visitors: false, age: 29)

clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
clinic_2 = Clinic.create!(name: 'Medical Plus', open: true, computers: 100)
clinic_3 = Clinic.create!(name: 'Healing Helpers', open: true, computers: 70)

clinic.doctors.create!(name: 'Brian', available: true, rating: 3.5)
clinic_2.doctors.create!(name: 'Jamison', available: false, rating: 4.7)
clinic_3.doctors.create!(name: 'Ian', available: true, rating: 4.0)
