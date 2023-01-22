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
    @map = Map.new(
      title: params[:title],
      content: params[:content],
    )
    
    if @map.save
      if params[:image]
        @map.image = "#{@map.id}.jpg"
        image = params[:image]
        File.binwrite("public/map_images/#{@map.image}", image.read)
        @map.save
      end
      @map.save
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
    @map.title = params[:title]
    @map.content = params[:content]
  
    if params[:image]
      @map.image = "#{@map.id}.jpg"
      image = params[:image]
      File.binwrite("map_images/#{@map.image}", image.read)
    end

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
end
