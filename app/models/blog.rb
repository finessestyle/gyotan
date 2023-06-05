class Blog < ApplicationRecord
  validates :user_id, {presence: true} 
  has_rich_text :content
  mount_uploader :image, ImageUploader
  is_impressionable counter_cache: true
        
  def user
    return User.find_by(id: self.user_id)
  end
  
end
