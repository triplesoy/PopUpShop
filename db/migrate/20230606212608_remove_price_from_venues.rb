class RemovePriceFromVenues < ActiveRecord::Migration[7.0]
  def change
    remove_column :venues, :price, :float
  end
end
