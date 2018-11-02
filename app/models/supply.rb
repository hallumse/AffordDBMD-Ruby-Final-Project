class Supply < ApplicationRecord
  has_many :discounts

  paginates_per 5
end
