# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Hospital.destroy_all
hospital = Hospital.create!(name: 'St. Lukes', max_capacity: false, beds: 300)
Hospital.create!(name: 'Sky Ridge', max_capacity: true, beds: 200)
Hospital.create!(name: 'Denver Health', max_capacity: false, beds: 600)

patient = Patient.create!(name: 'Mike', visitors: true, age: 37)
Patient.create!(name: 'Megan', visitors: true, age: 31)
Patient.create!(name: 'Bob', visitors: false, age: 29)

clinic = Clinic.create!(name: 'First Priority', open: false, computers: 80)
Clinic.create!(name: 'Medical Plus', open: true, computers: 100)
Clinic.create!(name: 'Healing Helpers', open: true, computers: 70)

doctor = Doctor.create!(name: 'Brian', available: true, rating: 3.5)
Doctor.create!(name: 'Jamison', available: false, rating: 4.7)
Doctor.create!(name: 'Ian', available: true, rating: 4.0)
