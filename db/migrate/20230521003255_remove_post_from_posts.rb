class RemovePostFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :images, :string
    remove_column :posts, :imges, :string
  end
end
