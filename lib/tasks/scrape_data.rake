require 'capybara'

desc "Adds WellRx Diabetic Prescriptions To Database"
task add_prescriptions: :environment do
  supplies = [
    { name: "Testing Strips", encoded_search_term: "onetouch%20ultra%20blue%20test%20strp" },
    { name: "Ultra Thin Lancets", encoded_search_term: "lancets%20ultra%20thin" },
    { name: "Alcohol Swabs", encoded_search_term: "alcohol%20swabs" },
    { name: "Diabetic Medication", encoded_search_term: "acarbose" },
    { name: "Diabetic Medication", encoded_search_term: "metformin%20hcl" },
    { name: "Diabetic Medication", encoded_search_term: "miglitol" },
    { name: "Insulin Syringe", encoded_search_term: "insulin%20syringe" },
    { name: "Cough Medicine", encoded_search_term: "diabetic%20tussin%20dm" }
  ]

  zip_codes = [
    "29605",
    "29305"
  ]

  base_url = "https://www.wellrx.com/prescriptions"

  supplies.each do |supply|
    zip_codes.each do |zipcode|
      url = "#{base_url}/#{supply[:encoded_search_term]}/?address=#{zipcode}"

      session = Capybara.current_session
      session.visit url

      supply_record = Supply.find_by(name: supply[:name])
      session.all('.tabs-content .row').each.with_index do |row, i|
        next unless i.even?
        pharmacy = row.all('.columns').first.text
        price = row.find('.pricesm').text

        Discount.create pharmacy: pharmacy, price: price, supply: supply_record, zipcode: zipcode
        print "."
      end
    end
  end
end
