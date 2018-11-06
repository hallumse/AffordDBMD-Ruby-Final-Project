require 'nokogiri'
require 'open-uri'

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

  # response = HTTParty.get("#{base_url}/#{drug_params[0]}/?address=#{zip_codes[0]}")
  html = Nokogiri::HTML(open("#{base_url}/#{drug_params[0]}/?address=#{zip_codes[0]}"))
  # The below gets to the right section of the html but isn't showing any child elements even though
  # we know they exist.
  html.css("div.tabs-content").css("section#res")
  byebug
end
