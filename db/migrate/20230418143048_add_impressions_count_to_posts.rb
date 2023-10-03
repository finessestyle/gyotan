class AddImpressionsCountToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :impressions_count, :integer, default: 0
    add_column :blogs, :impressions_count, :integer, default: 0
  end
end
