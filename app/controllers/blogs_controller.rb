class BlogsController < ApplicationController
  before_action :get_blog, only: [ :edit, :update, :destroy]

  def index
    @blogs = Blog.all.order("created_at DESC")
  end

  def show
    @blog = Blog.all.find(params[:id])
  end

  def new
    @blog = current_user.blogs.new
  end

  def edit
  end

  def create
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      flash[:notice] = "Successfully created post!"
      redirect_to @blog
    else 
      render :new
    end
  end

  def update   
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path
  end
 
  private
  def blog_params
    params.require(:blog).permit(:blog_name).merge(user: current_user)
  end

  def get_blog
    if user_signed_in?
      @blog = current_user.blogs.find(params[:id])
    end
  end
end
