class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  require 'exifr/jpeg'

  def top
    @posts = Post.all.order(created_at: :desc) 
    @posts = Post.where(user_id: @current_user.id).where.not(image: nil)
  end
end
