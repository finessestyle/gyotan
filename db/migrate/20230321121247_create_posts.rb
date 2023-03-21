class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :image
      t.string :weather
      t.float :latitude
      t.float :longitude
      t.datetime :datetime
      t.text :content
      t.float :length
      t.integer :weight
      t.string :lure
      t.string :lure_color
      t.integer :catch_fish
      t.string :fish_area

      t.timestamps
    end
  end
end
