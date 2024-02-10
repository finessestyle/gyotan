class AddColumnUrlToMaps < ActiveRecord::Migration[6.1]
  def change
    add_column :maps, :url, :string
    add_column :maps, :season, :string
  end
end
