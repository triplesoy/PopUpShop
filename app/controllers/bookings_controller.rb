class BookingsController < ApplicationController
  def show
  end

  def new
    @booking = Booking.new
    # redirect_to venue_path(@list.id), status: :see_other
  end

  def create
    @booking = Booking.new(booking_params)
    @venue = Venue.find(params[:venue_id])
    @booking.venue = @venue
    @booking.user = current_user
    if @booking.save!
      # Booking saved successfully
      redirect_to venue_booking_path(@booking.venue, @booking), status: :see_other
    else
      # Booking failed to save
      render :new
    end
   # redirect_to list_path(@booking.venue), status: :see_other
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end
end
