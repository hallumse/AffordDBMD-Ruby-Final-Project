require 'faker'

FactoryBot.define do
  factory :discount do
    brand 'Acarbose'
    form 'tablet'
    dosage '10mg'
    quantity '30'
    price '50.00'
    pharmacy 'Walgreens'
  end

  factory :random_discount, class: Discount do
    brand { Faker::Brand.brand_name }
    form { Faker::Form.form_name }
    dosage { Faker::Dosage.dosage_amount }
    quantity { Faker::Quantity.quantity_amount }
    price { Faker::Price.price_amount }
    pharmacy { Faker::Pharmacy.pharmacy_name }
  end
end
