class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :sub_title
      t.string :image
      t.text :content
      t.integer :user_id
      t.string :category
      
      t.timestamps
    end
  end
end
