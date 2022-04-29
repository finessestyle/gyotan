class Blog < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 32}}
  validates :user_id, {presence: true}
  
  def blogs
    return Blog.find_by(id: self.blog_id)
  end
  
end