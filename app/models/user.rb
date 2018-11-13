require 'twilio-ruby'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.notify_about_discount(discount_id)
    # put your own credentials here
    account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
    auth_token = Rails.application.credentials.dig(:twilio, :auth_token)

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    discount = Discount.find(discount_id)
    body = "A new item is discounted. You can buy #{discount.supply.name} at #{discount.location} for $#{discount.price} "
    User.all.each do |user|
      @client.api.account.messages.create(
        from: '+18644796617',
        to: user.phone,
        body: body
      )
    end
  end

  def notify_about_discount(discount_id)
  end
end
