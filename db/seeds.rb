require 'faker'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "asdf", email: "asdf@asdf.com", password: "testing")

User.create!(name: "Tori Hall", email: "tori@tori_hall.dev", password: "testing1")

40.times do
  Supply.create!({
    name: "Dr. #{Faker::Name.first_name}'s Testing Strips",
    upc: SecureRandom.hex(10)
  })
end

[
  {
    brand: "Acarbose",
    form: "tablet",
    dosage: "10mg",
    quantity: "30",
    price: "50.00",
    pharmacy: "Walgreens",
    supply_id: 1
  },
  {
    brand: "Acarbose",
    form: "tablet",
    dosage: "10mg",
    quantity: "30",
    price: "30.00",
    pharmacy: "Walmart",
    supply_id: 1
  },
  {
    brand: "Acarbose",
    form: "tablet",
    dosage: "10mg",
    quantity: "30",
    price: "42.00",
    pharmacy: "CVS",
    supply_id: 1
  },
  {
    brand: "One Touch",
    form: "testing strips",
    dosage: "1 strip",
    quantity: "30 strips",
    price: "10.00",
    pharmacy: "Walmart",
    supply_id: 2
  },
  {
    brand: "One Touch",
    form: "testing strips",
    dosage: "1 strip",
    quantity: "30 strips",
    price: "30.00",
    pharmacy: "Walgreens",
    supply_id: 2
  },
  {
   brand: "One Touch",
   form: "testing strips",
   dosage: "1 strip",
   quantity: "30 strips",
   price: "35.00",
   pharmacy: "CVS",
   supply_id: 2
 },
 {
   brand: "Accu-Chek",
   form: "lancet",
   dosage: "1 lancet",
   quantity: "1 lancet",
   price: "15.99",
   pharmacy: "Walmart",
   supply_id: 3
 },
 {
   brand: "Accu-Chek",
   form: "lancet",
   dosage: "1 lancet",
   quantity: "1 lancet",
   price: "19.99",
   pharmacy: "Walgreens",
   supply_id: 3
 },
  {
   brand: "Accu-Chek",
   form: "lancet",
   dosage: "1 lancet",
   quantity: "1 lancet",
   price: "21.99",
   pharmacy: "CVS",
   supply_id: 3
 },
].each do |item_data|
  Discount.create(item_data)
end

p "Created #{Discount.count} entries."
