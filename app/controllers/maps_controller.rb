class MapsController < ApplicationController
  before_action :authenticate_user, {only: [:new, :create, :edit, :update, :destroy]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  require 'mini_magick'

  def index
    @maps1 = Map.where(area: "北湖北")
    @maps2 = Map.where(area: "北湖東")
    @maps3 = Map.where(area: "北湖西")
    @maps4 = Map.where(area: "南湖東")
    @maps5 = Map.where(area: "南湖西")
  end

  def show
    @map = Map.find_by(id: params[:id])
    gon.lat = @map.latitude
    gon.lon = @map.longitude
    gon.api = '927f1581d1d1a2a5e28a37a6a0a2d10e'
  end

  def new
    @map = Map.new
  end
  
  def create
    @map = Map.new(map_params)
    if @map.save
      flash[:notice] = "投稿しました"
      redirect_to("/maps/index")
    else
      render("maps/new")
    end
  end

  def edit
    @map = Map.find_by(id: params[:id])
  end
  
  def update
    @map = Map.find_by(id: params[:id])
    @map.update(map_params)
    
    if @map.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/maps/index")
    else
      render("maps/edit")
    end
  end
  
  def destroy
    @map = Map.find_by(id: params[:id])
    @map.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/maps/index")
  end

  def ensure_correct_user
    @map = Map.find_by(id: params[:id])
    if @map.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/blogs/index")
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def map_params
      params.require(:map).permit(:title, :content, :image, :area, :latitude, :longitude, :url).merge(:user_id => @current_user.id)
    end

end
