class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :image
      t.string :title
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :user_id
      t.string :up_image
      t.integer :length
      t.integer :weight
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :lure

      t.timestamps
    end
  end
end
