class ChangePostsColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :date_time, :datetime
  end
end
