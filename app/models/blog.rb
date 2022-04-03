class Blog < ApplicationRecord
  def blog
    return Blog.find_by(id: self.blog_id)
  end
end