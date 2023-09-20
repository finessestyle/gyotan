class AddLatitudeToMaps < ActiveRecord::Migration[6.1]
  def change
    add_column :maps, :latitude, :float
    add_column :maps, :longitude, :float
  end
end
