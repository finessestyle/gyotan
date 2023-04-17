class MapsController < ApplicationController
  before_action :authenticate_user

  def index
    @maps = Map.all.order(created_at: :desc)
  end

  def show
    @map = Map.find_by(id: params[:id])
  end

  def new
    @map = Map.new
  end
  
  def create
    @map = Map.new(map_params)
    
    if @map.save
      flash[:notice] = "投稿しました"
      redirect_to("/maps")
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

  private
    # Only allow a list of trusted parameters through.
    def map_params
      params.permit(:title, :content, :image).merge(:user_id => @current_user.id)
    end

end
