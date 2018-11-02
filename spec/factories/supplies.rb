require 'faker'

FactoryBot.define do
  factory :supply do
    name 'Acarbose'
    price '50.00'
    upc '36438076006'

    factory :random_supply, class: Discount do
        name { Faker::Brand.brand_name }
        price { Faker::Price.price_amount }
        upc { Faker::UPC.upc_number }
    end
  end
end
