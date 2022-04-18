class AddBlogToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column:blogs, :title, :string
    add_column:blogs, :image, :string
  end
end
