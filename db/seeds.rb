# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Garages
garages = []
3.times do
  garages << Garage.create!(
    nom: Faker::Company.name,
    adresse: Faker::Address.full_address,
    capacite: rand(10..30)
  )
end

# Employés
employes = []
12.times do
  employes << Employe.create!(
    nom: Faker::Name.name,
    specialite: ["Mécanique", "Peinture", "Diagnostic", "Carrosserie"].sample,
    garage: garages.sample
  )
end

# Propriétaires
proprietaires = []
21.times do
  proprietaires << Proprietaire.create!(
    nom: Faker::Name.name,
    email: Faker::Internet.email,
    telephone: Faker::PhoneNumber.phone_number
  )
end

# Voitures
voitures = []
21.times do
  voitures << Voiture.create!(
    numero_immatriculation: Faker::Vehicle.license_plate,
    couleur: Faker::Color.color_name,
    statut: ["Disponible", "En réparation", "Vendue"].sample,
    annee: rand(1995..2022),
    marque: Faker::Vehicle.make,
    garage: garages.sample,
    proprietaire: proprietaires.sample
  )
end

# Services
10.times do
  Service.create!(
    date: Faker::Date.backward(days: 100),
    type_service: ["Vidange", "Inspection", "Changement de pneus", "Alignement"].sample,
    cout: rand(100.0..700.0).round(2),
    voiture: voitures.sample,
    employe: employes.sample
  )
end

# Parts
53.times do
  Part.create!(
    nom: Faker::Vehicle.car_options.sample,
    prix: rand(20.0..300.0).round(2),
    stock: rand(1..20),
    voiture: voitures.sample
  )
end


