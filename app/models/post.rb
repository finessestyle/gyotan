class Post < ApplicationRecord
  validates :user_id,{presence: true}
  
  mount_uploader :image, ImageUploader
  is_impressionable counter_cache: true

  def user
    return User.find_by(id: self.user_id)
  end

  def previous
    Post.where("id < ?", self.id).order("id DESC").first
  end

  def next 
    Post.where("id > ?", self.id).order("id ASC").first
  end
  
end
