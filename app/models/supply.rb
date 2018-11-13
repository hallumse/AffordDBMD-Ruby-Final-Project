class Supply < ApplicationRecord
  has_many :discounts

  paginates_per 5

  include PgSearch
  pg_search_scope :search_by_name_and_brand, :against => [:brand, :name],
    using: { tsearch: { prefix: true } }
end
