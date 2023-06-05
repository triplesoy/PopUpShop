class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :address
      t.string :description
      t.string :img_url
      t.integer :surface_area
      t.integer :daily_rate
      t.string :venue_type
      t.boolean :has_parking
      t.boolean :has_internet
      t.boolean :has_ac
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
