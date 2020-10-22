# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.create!(city_name:"Rennes")
City.create!(city_name:"Nantes")
City.create!(city_name:"Brest")
puts "3 villes créées"

Specialty.create!(name: "généraliste")
Specialty.create!(name: "pédiatre")
Specialty.create!(name: "rhumatologue")
Specialty.create!(name: "chirurgien")
puts "4 spécialités"

10.times do
    patient_list = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.find(rand(1..3)))
end
puts "10 patients dans la liste"

5.times do
    doctor_list = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city: City.find(rand(1..3)))
end
puts "5 docteurs"

30.times do
    appointment_list = Appointment.create!(doctor: Doctor.find(rand(1..5)), patient: Patient.find(rand(1..10)), date: Faker::Time.between_dates(from: Date.today, to: Date.today + 365, period: :day), city: City.find(rand(1..3)))
end
puts "30 rdv"

5.times do
    doc_and_specialty_list = DoctorsBySpecialty.create!(doctor: Doctor.find(rand(1..5)), specialty: Specialty.find(rand(1..4)))
end