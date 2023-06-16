class AddAreaToMaps < ActiveRecord::Migration[6.1]
  def change
    add_column :maps, :area, :string
  end
end
