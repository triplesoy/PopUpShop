class VenuesController < ApplicationController
  before_action :set_venue, only: [ :edit, :update, :show, :destroy, :my_venues ]


  def index
    @venues = Venue.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @venue = Venue.new
    @categories = ["Bar/Club", "Office", "Restaurant", "Storefront"]

  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    if @venue.save
      redirect_to venues_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
  end

  def destroy
    @venue.destroy
    redirect_to venues_path, status: :see_other
  end

  def my_venues
    @my_venues = current_user.venues
  end

  private

  def set_venue
    @venue = Venue.find_by(id: params[:id])
  end

  def venue_params
    params.require(:venue).permit(:title, :address, :description, :img_url, :surface_area, :daily_rate, :venue_type, :has_parking, :has_internet, :has_ac, :video, photos: [])
  end

  def set_booking
    @booking = Booking.find(params[:venue_id])
  end
end
