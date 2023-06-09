class BookingsController < ApplicationController
  before_action :set_venue, only: [:new, :create, :edit, :update, :show, :total_price]
  before_action :set_booking, only: [:show, :destroy, :edit, :update]

  def show
    unless @booking.user == current_user
      redirect_to venues_path, status: :see_other, alert: "You are not authorized to see this booking"
    end
  end

  def new
    @booking = Booking.new
    # redirect_to venue_path(@list.id), status: :see_other
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.venue = Venue.find(params[:venue_id])
    @booking.user = current_user

    if @booking.save!
##QR CODE
      link = venue_booking_url(@booking.venue, @booking)
      qrcode = RQRCode::QRCode.new(link)
      png = qrcode.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: "black",
        file: nil,
        fill: "white",
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 120
      )
      ##Using MiniMagick to resize the QR code and place it on the venue image

      qr_image = MiniMagick::Image.read(png.to_s)
      #here i pass the main image of the venue on the QR code
      background = MiniMagick::Image.open(@booking.venue.photos.first)

      # resize the QR code to be 90% of the background image's smallest dimension
      smaller_dimension = [background.width, background.height].min
      qr_size = (smaller_dimension * 0.9).round

      # resize the QR code
      qr_image.resize "#{qr_size}x#{qr_size}"

      # calculate the position where the QR code should be placed in order to be centered
      qr_position_x = ((background.width - qr_image.width) / 2).round
      qr_position_y = ((background.height - qr_image.height) / 2).round

      result = background.composite(qr_image) do |c|
        c.compose "Over"    # OverCompositeOp
        c.geometry "+#{qr_position_x}+#{qr_position_y}" # position of QR code on the background image
      end

      # Draw user's name at the top
      result.combine_options do |c|
        c.gravity 'North'
        c.pointsize '40'
        c.draw "text 0,60 '#{current_user.first_name} #{current_user.last_name}'"
        c.fill 'black'
      end

      # Draw dates at the bottom
      result.combine_options do |c|
        c.gravity 'South'
        c.pointsize '40'
        c.draw "text 0,40 'From: #{@booking.start_date.strftime("%d/%m/%Y")} to #{@booking.end_date.strftime("%d/%m/%Y")}'"
        c.fill 'black'
      end

      result.write("composite_image.png") # replace with actual path where you want to store it
      @booking.qrcode.attach(io: File.open("composite_image.png"), filename: "qr_code.png", content_type: "image/png")

##END OF QR CODE

      @booking.save!
      redirect_to venue_booking_path(@booking.venue, @booking), status: :see_other
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to venue_booking_path(@booking.venue, @booking), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to my_bookings_path
  end

  def my_bookings
    @my_bookings = current_user.bookings
    if @my_bookings.empty?
      redirect_to venues_path, status: :see_other
    end
  end

  def total_price(start_date, end_date, venue)
    @booking = booking
    @venue = venue
    @total_days = (end_date - start_date).to_i + 1
    @total_days
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end

  def set_venue
    @venue = Venue.find(params[:venue_id])
  end
end
