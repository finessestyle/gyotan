class AddSubTitleToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :sub_title, :string
  end
end
