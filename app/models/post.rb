class Post < ApplicationRecord
  validates :user_id,{presence: true}
  validates :images, length: {maximum: 3}
  mount_uploaders :images, ImageUploader
  belongs_to :user
  serialize :images, JSON

  scope :created_day, ->(n) {where(created_at: n.days.ago.all_day)}

  def user
    return User.find_by(id: self.user_id)
  end
end
