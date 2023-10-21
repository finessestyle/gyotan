class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  require 'exifr/jpeg'
  require 'mini_magick'

  def top
    @posts = Post.all.order(created_at: :desc).limit(1)
    @posps = Post.all.order(created_at: :desc).limit(5).offset(1)
    @blogs = Blog.all.order(created_at: :desc).limit(1)
    @blops = Blog.all.order(created_at: :desc).limit(5).offset(1)
  end
end
