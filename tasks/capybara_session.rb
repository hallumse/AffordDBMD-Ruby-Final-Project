task :scrape do |
  session = Capybara::Session.new(:selenium)
    session.visit @url
    session.all('.tabs-content .row').each do |row|
      @pharmacy_name = row.all('.columns').first.text
      @price = row.find('.pricesm').text

      Discount.create price: @price, pharmacy: @pharmacy_name
    end|
end
