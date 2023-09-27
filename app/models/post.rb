class Post < ApplicationRecord
  validates :user_id,{presence: true}
  mount_uploaders :images, ImageUploader
  is_impressionable counter_cache: true

  def user
    return User.find_by(id: self.user_id)
  end

end
