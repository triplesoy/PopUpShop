class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_one_attached :qrcode
end
