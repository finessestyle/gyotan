class HomeController < ApplicationController
  before_action :forbid_login_user, {only: [:top]}
  
  def top
<<<<<<< HEAD
    
    @posts = Post.all.order(created_at: :desc)

=======
    @posts = Post.all.order(created_at: :desc)
>>>>>>> 3537dd70f5541d15b57f64d39c004956020d720e
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
