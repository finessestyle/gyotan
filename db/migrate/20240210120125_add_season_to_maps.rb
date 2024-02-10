class AddSeasonToMaps < ActiveRecord::Migration[6.1]
  def change
    add_column :maps, :season, :string
  end
end
