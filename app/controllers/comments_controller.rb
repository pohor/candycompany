class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:destroy, :update, :edit]
  before_action :logged_in?, only: [:create]
  before_action :authenticate_user, only: [:destroy, :edit, :update]

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "You have successfuly added a comment."
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end


  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "You have successfuly updated the comment."
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "You have deleted the comment."
    redirect_to post_path(@post)
  end

  private

  def authenticate_user
    if @comment.user != current_user && !current_user&.admin?
      flash[:alert] = "You are not allowed to do this."
      redirect_to post_path(@post)
      return false
    end
  true
  end

  def logged_in?
    current_user
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end


  def comment_params
    comment_params = params.require(:comment).permit(:text)
  end

end
