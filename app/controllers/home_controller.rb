class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  require 'exifr/jpeg'
  require 'mini_magick'

  def top
    @posts = Post.all.order(created_at: :desc)
    # @posps = Post.all.order(created_at: :desc).limit(3).offset(1)
    @blogs = Blog.all.order(created_at: :desc)
    # @blops = Blog.all.order(created_at: :desc).limit(3).offset(1)
  end
end
