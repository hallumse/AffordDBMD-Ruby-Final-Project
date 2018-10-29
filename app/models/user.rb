class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.notify_about_discount (url)
    client = Twilio::Rest::client
    User.all.each do |user|
      Client.api.account.messages
        create(
          from: "Tori",
          to: User.phone,
          body: "Sale!#{url}"
          )
      end
    end
end
