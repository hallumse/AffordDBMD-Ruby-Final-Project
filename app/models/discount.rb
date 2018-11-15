class Discount < ApplicationRecord
  belongs_to :supply

  scope :local_to_user, ->(user) { where(zipcode: user.zipcode) }
end
