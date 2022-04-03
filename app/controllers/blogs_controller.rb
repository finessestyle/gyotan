class BlogsController < ApplicationController

  def index
  end

  def show
    @blog = Blog.find_by(id: params[:id])
  end

end
