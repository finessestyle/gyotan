class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :sub_title
      t.string :video
      t.text :content
      t.integer :user_id
      t.string :category

      t.timestamps
    end
  end
end
