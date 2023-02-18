class Post < ApplicationRecord
  validates :user_id,{presence: true}
  validates :title,{presence: true, length:{maximum: 20}}
  validates :content, {presence: true, length: {maximum: 100}}
  validates :date_time,{presence:true}
  
  def user
    return User.find_by(id: self.user_id)
  end
end
