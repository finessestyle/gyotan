class Blog < ApplicationRecord
  validates :title, {presence: true, length: {maximum: 32}}
  validates :sub_title, {presence: true, length: {maximum: 10}}
  validates :user_id, {presence: true}
    
  def user
    return User.find_by(id: self.user_id)
  end
  
end
