class User < ApplicationRecord
  is_impressionable counter_cache: true
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :image, {presence: true}
  has_secure_password
  mount_uploader :image, ImageUploader

  def posts
    return Post.where(user_id: self.id)
  end
    
  def blogs
    return Blog.where(user_id: self.id)
  end
  
  def likes
    return Like.where(user_id: self.id)
  end  
end
