class Post < ApplicationRecord
  validates :user_id,{presence: true}
  validates :title,{presence: true, length:{maximum: 20}}
  validates :content, {presence: true, length: {maximum: 60}}
  
  mount_uploader :image, ImageUploader
  is_impressionable counter_cache: true

  def user
    return User.find_by(id: self.user_id)
  end
end
