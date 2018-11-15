desc "Alerts users to new local discounts"
task alert_user: :environment do
  account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
  auth_token = Rails.application.credentials.dig(:twilio, :auth_token)
  client = Twilio::REST::Client.new account_sid, auth_token

  # iterate over all discounts
  # In real life, you want to only iterate over _new_ discounts, i.e. discounts that have been
  # created in your db in the past ~24 hours, for example.
  Discount.where('created_at < ?', 1.hour.ago) do |discount|
    # find users that match the individual discount's zip code
    users = User.where(zipcode: discount.zipcode)

    # send a text message to each user with that discount
    puts "Notifying #{users.count} users of discount in their area."
    body = "A new item is discounted! You can buy #{discount.supply.name} at #{discount.pharmacy} for #{discount.price}."
    users.each do |user|
      client.api.account.messages.create(
        from: '+18644796617',
        to: user.phone,
        body: body
      )
    end
  end
end
