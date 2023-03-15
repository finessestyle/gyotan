class Post < ApplicationRecord
  validates :user_id,{presence: true}
  validates :title,{presence: true, length:{maximum: 20}}
  validates :content, {presence: true, length: {maximum: 100}}
  
  mount_uploader :image, ImageUploader

  def user
    return User.find_by(id: self.user_id)
  end
end
