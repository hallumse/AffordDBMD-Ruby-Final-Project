require 'capybara'

desc "Adds WellRx Diabetic Prescriptions To Database"
task add_prescriptions: :environment do
  drug_params = [
    "acarbose",
    "metformin%20hcl",
    "miglitol",
    "onetouch%20ultra%20blue%20test%20strp",
    "lancets%20ultra%20thin",
    "insulin%20syringe",
    "diabetic%20tussin%20dm",
  ]


  zip_codes = [
    "29306",
    "29680",
    "29607",
    "29681",
    "29609",
    "29611",
    "29683",
    "29614",
    "29613",
    "29616",
    "29615",
    "29687",
    "29690",
    "29617",
    "29627"
  ]

  base_url = "https://www.wellrx.com/prescriptions/"

  drug_params.each do |drug|
    url = "https://www.wellrx.com/prescriptions/#{drug}/?address=29305"
    session = Capybara.current_session
    session.visit url


    session.all('.tabs-content .row').each do |row|
      pharmacy = row.all('.columns').first.text
      price = row.find('.pricesm').text

      Discount.create pharmacy: pharmacy, price: price

    end
  end
end
