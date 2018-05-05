class PostsController < ApplicationController
#    protect_from_forgery unless: -> { request.format.json? }
    def index
        @posts = Post.all
    end
  
    def show
      @post = Post.find(params[:id])
    end
  
    def new
      
    end
  
    def create
#      render plain: params[:post].inspect
      @post = Post.new(post_params)
      @post.save
      redirect_to @post
    end
  
    private def post_params
      params.require(:post).permit(:author, :title, :description)
    end
end
