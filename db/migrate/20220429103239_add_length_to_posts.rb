class AddLengthToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :length, :integer
  end
end
