require 'faker'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "Tori", email: "tori@hall.com", password: "testing", phone: "+18643499489", zipcode: "29605")

supplies = [
  { name: "Testing Strips", brand: "One Touch" },
  { name: "Ultra Thin Lancets", brand: "One Touch" },
  { name: "Alcohol Swabs", brand: "Easy Touch" },
  { name: "Diabetic Medication", brand: "Acarbose" },
  { name: "Diabetic Medication", brand: "Metformin HCL" },
  { name: "Diabetic Medication", brand: "Miglitol" },
  { name: "Insulin Syringe", brand: "" },
  { name: "Cough Medicine", brand: "Diabetic Tussin DM" }
]
supplies.each do |supply|
  Supply.create!({
    name: supply[:name],
    upc: SecureRandom.hex(10),
    brand: supply[:brand]
  })
end
