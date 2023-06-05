class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def previous
    user.posts.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
    user.blogs.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    user.posts.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
    user.blogs.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end
  
end
