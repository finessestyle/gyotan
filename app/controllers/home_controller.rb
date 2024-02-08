class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  require 'exifr/jpeg'
  require 'mini_magick'

  def top
    # @posts = Post.all.order(created_at: :desc)
    @post1 = Post.where(fish_area: "北湖北エリア").limit(9)
    @post2 = Post.where(fish_area: "北湖東エリア").limit(9)
    @post3 = Post.where(fish_area: "北湖西エリア").limit(9)
    @post4 = Post.where(fish_area: "南湖東エリア").limit(9)
    @post5 = Post.where(fish_area: "南湖西エリア").limit(9)
    # @blogs = Blog.all.order(created_at: :desc)
    # @blops = Blog.all.order(created_at: :desc).limit(3).offset(1)
  end
end
