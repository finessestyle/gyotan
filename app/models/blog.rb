class Blog < ApplicationRecord
  validates :user_id, {presence: true}
  
  def blogs
    return Blog.find_by(id: self.blog_id)
  end
  
end