class Map < ApplicationRecord
  validates :user_id, {presence: true} 
  has_rich_text :content
  mount_uploader :image, ImageUploader
        
  def user
    return User.find_by(id: self.user_id)
  end
end
