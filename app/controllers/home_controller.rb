class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  require 'exifr/jpeg'

  def top
    @posts = Post.all.order(created_at: :desc).limit(1)
    @blogs = Blog.all.order(created_at: :desc).limit(1)
  end
end
