class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  require 'exifr/jpeg'
  require 'mini_magick'

  def top
    @posts = Post.all.order(created_at: :desc).limit(9)
  end
end
