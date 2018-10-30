require 'twilio-ruby'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.notify_about_discount (url)
    # put your own credentials here
    account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
    auth_token = Rails.application.credentials.dig(:twilio, :auth_token)

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    User.all.each do |user|
      @client.api.account.messages.create(
        from: '+18644796617',
        to: user.phone,
        body: 'Hey Tori!'
      )
    end
  end
end
