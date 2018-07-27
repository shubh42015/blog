class CommentsController < ApplicationController
  before_action :get_id 

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = @post.comments.create(comment_params)
    if @comment.save
      flash[:notice] = "Successfully created comment!"
      redirect_to blog_post_path(@blog, @post) 
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to blog_post_path(@blog, @post) 
    else
      render 'edit'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_post_path(@blog, @post)
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def get_id
    @blog = Blog.find(params[:blog_id])
    @post = @blog.posts.find(params[:post_id])
  end

end
