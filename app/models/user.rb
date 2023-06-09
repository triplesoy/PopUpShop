class User < ApplicationRecord
  has_many :bookings
  has_many :venues, dependent: :destroy
  has_many :booked_venues, through: :bookings, source: :venue
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  def owns_this_venue?(venue)
    self.venues.include?(venue)
  end
end
