class ChangePostsColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :images, :json
    remove_column :posts, :image, :string
  end
end
