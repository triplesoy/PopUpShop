class AddQrCodeIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :qr_code_id, :string
  end
end
