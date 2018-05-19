class PostsController < ApplicationController
#    protect_from_forgery unless: -> { request.format.json? }
    def index
        @posts = Post.all
        render 'index'
    end
  
    def show
      @post = Post.find(params[:id])
      @show_edit = false;
      if current_user
        if (@post.author == current_user.username || current_user.rank == "admin") 
          @show_edit = true;
        end
      end
    end
  
    def new
      if current_user
      else
        redirect_to '/login'
      end
    end
  
    def create
#      render plain: params[:post].inspect
      @post = Post.new(post_params)
      @post.author = current_user.username
      if(@post.save)
        redirect_to @post
      else
        render 'new'
      end
    end
  
    def edit
      @post = Post.find(params[:id])
      @post.author = current_user.username
    end
  
    def update
      @post = Post.find(params[:id])
      
      if(@post.update(post_params))
        redirect_to @post
      else
        render 'edit'
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end
  
    def dashboard
      @posts = Post.all
#      render plain: params[:post].inspect
      render 'dashboard'
    end

    private def post_params
      params.require(:post).permit(:author, :title, :description)
    end
      
end
