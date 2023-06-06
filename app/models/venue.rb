class Venue < ApplicationRecord
  CATEGORIES = ["Bar/Club", "Office", "Restaurant", "Storefront"]
  belongs_to :user
end
