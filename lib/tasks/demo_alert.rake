desc "Demo Day Alert Rake Task"
task demo_alert: :environment do
  account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
  auth_token = Rails.application.credentials.dig(:twilio, :auth_token)
  client = Twilio::REST::Client.new account_sid, auth_token

  user = User.first
  discount = Discount.where(zipcode: user.zipcode).sample
  puts "Notifying #{user.name} of discount."

  body = "A new item is discounted! You can buy #{discount.supply.name} at #{discount.pharmacy} for #{discount.price}."

  client.api.account.messages.create(
    from: '+18644796617',
    to: user.phone,
    body: body
  )
end
