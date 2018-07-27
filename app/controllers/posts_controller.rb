class PostsController < ApplicationController
  before_action :get_blog, except: [:show]
  before_action :get_post, only: [:edit, :update, :destroy]
  def index
    
  end

  def new
    @post = @blog.posts.new
  end

  def edit
  end

  def create
    @post = @blog.posts.create(post_params)
    @post.save
    redirect_to blog_path(@blog)  
  end

  def show
    @blog = Blog.all.find(params[:blog_id])
    @post = @blog.posts.find(params[:id])
    @comment = @post.comments.new
  end

  def update   
    if @post.update(post_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to blogs_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :avatar)
    end

    def get_blog
      @blog = current_user.blogs.find(params[:blog_id])
    end

    def get_post
      @post = @blog.posts.find(params[:id])
    end
end
