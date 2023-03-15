class Posts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :addres, :string
    remove_column :posts, :latitude, :string
    remove_column :posts, :longitude, :string
  end
end
