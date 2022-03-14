class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}

  def top
    @post = Post.new(
      content: params[:content],
      image: params[:image]
    )

    if params[:image]
      @post.image = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image}", image.read)
    end

  end

  
  def area
  end

end
