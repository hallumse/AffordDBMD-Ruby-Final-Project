require 'twilio-ruby'

# put your own credentials here
account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
auth_token = Rails.application.credentials.dig(:twilio, :auth_token)

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

from = ""
