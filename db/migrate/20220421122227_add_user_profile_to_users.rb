class AddUserProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile, :integer
  end
end
