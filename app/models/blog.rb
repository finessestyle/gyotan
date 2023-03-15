class Blog < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 32}}
  validates :user_id, {presence: true} 
  validates :content, {presence: true}
  has_rich_text :content

  mount_uploader :image, ImageUploader
        
  def user
    return User.find_by(id: self.user_id)
  end
end
