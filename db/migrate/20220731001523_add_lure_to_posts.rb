class AddLureToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :lure, :integer
  end
end
