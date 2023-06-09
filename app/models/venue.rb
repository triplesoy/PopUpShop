class Venue < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :invitees, through: :bookings, source: :user
  validates :title, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :surface_area, presence: true
  validates :daily_rate, presence: true

  has_many_attached :photos
  has_one_attached :video
end
