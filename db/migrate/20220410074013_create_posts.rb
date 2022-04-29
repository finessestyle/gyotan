class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :image
      t.string :title
      t.string :up_image
      t.smallint :length

      t.timestamps
    end
  end
end
