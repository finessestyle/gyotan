class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.text :content
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
