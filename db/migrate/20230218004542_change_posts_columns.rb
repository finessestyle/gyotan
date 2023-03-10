class ChangePostsColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :image_two, :string
    remove_column :posts, :image_three, :string
  end
end
