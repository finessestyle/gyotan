class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  require 'exifr/jpeg'
  require 'mini_magick'

  def top
    @posts1 = Post.where(fish_area: "北湖北")
    @posts2 = Post.where(fish_area: "北湖東")
    @posts3 = Post.where(fish_area: "北湖西")
    @posts4 = Post.where(fish_area: "南湖東")
    @posts5 = Post.where(fish_area: "南湖西")
    # @posts = Post.all.order(created_at: :desc)
    # @posps = Post.all.order(created_at: :desc).limit(3).offset(1)
    @blogs = Blog.all.order(created_at: :desc)
    # @blops = Blog.all.order(created_at: :desc).limit(3).offset(1)
    @maps1 = Map.where(area: "北湖北")
    @maps2 = Map.where(area: "北湖東")
    @maps3 = Map.where(area: "北湖西")
    @maps4 = Map.where(area: "南湖東")
    @maps5 = Map.where(area: "南湖西")
  end
end
