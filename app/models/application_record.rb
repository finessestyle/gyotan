class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def previous
    user.posts.where('created_at < ? OR (created_at = ? AND id < ?)', created_at, created_at, id).order(created_at: :desc, id: :desc).first
    user.blogs.where('created_at < ? OR (created_at = ? AND id < ?)', created_at, created_at, id).order(created_at: :desc, id: :desc).first
    user.maps.where('created_at < ? OR (created_at = ? AND id < ?)', created_at, created_at, id).order(created_at: :desc, id: :desc).first
  end
  
  def next
    user.posts.where('created_at > ? OR (created_at = ? AND id > ?)', created_at, created_at, id).order(created_at: :asc, id: :asc).first
    user.blogs.where('created_at > ? OR (created_at = ? AND id > ?)', created_at, created_at, id).order(created_at: :asc, id: :asc).first
    user.maps.where('created_at > ? OR (created_at = ? AND id > ?)', created_at, created_at, id).order(created_at: :asc, id: :asc).first 
  end
  
end
