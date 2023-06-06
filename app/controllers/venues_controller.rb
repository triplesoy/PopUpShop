class VenuesController < ApplicationController
  before_action :set_venue, only: [:new, :create, :edit, :update, :show]
  before_action :set_booking, only: :destroy

  def index
    @venues = Venue.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.save
    redirect_to venues_path, status: :see_other
  end

  def edit
  end

  def update
  end

  def destroy
    @venue.destroy
    redirect_to venues_path, status: :see_other
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:booking).permit(:address, :description, :img_url, :surface_area, :daily_rate, :venue_type, :has_parking, :has_internet, :has_ac, :user_id)
  end

  def set_booking
    @booking = Booking.find(params[:venue_id])
  end
end
