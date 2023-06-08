class RemoveColumnImg < ActiveRecord::Migration[7.0]
  def change
    remove_column :venues, :img_url
  end
end
