class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :image
      t.string :image_two
      t.string :image_three
      t.string :weather
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :content
      t.integer :weight
      t.string :lure
      t.integer :catch_fish
      t.string :lure_color
      t.float :length
      t.string :fish_area

      t.timestamps
    end
  end
end
