class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  require 'exifr/jpeg'

  def top
    @posts = Post.all.order(created_at: :desc) 
  end
  
  def show
    @spot = Spot.find(params[:id])
    gon.spot = @spot
    gon.api = Rails.application.credentials.open_weather_api_key
  end

end
