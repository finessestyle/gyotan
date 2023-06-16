class CreateMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :maps do |t|
      t.string :title
      t.string :sub_title
      t.string :image
      t.text :content
      t.integer :user_id
      t.string :area
      
      t.timestamps
    end
  end
end
