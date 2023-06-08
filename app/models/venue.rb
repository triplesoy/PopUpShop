class Venue < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :surface_area, presence: true
  validates :daily_rate, presence: true
end
