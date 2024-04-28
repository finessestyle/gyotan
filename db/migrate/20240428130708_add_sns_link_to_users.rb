class AddSnsLinkToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :youtube, :string
    add_column :users, :twitter, :string
    add_column :users, :instagram, :string
  end
end
