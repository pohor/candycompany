class CommentsController < ApplicationController
  before_action :find_commented

    def new
      @comment = Comment.new
    end

    def create
      @comment = @commented.comments.new comment_params

      if @comment.save
        flash[:notice] = "You have successfuly added the comment."
        redirect_back(fallback_location: root_path)
      else
        render 'posts/show'
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commented
      @commented = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commented = Post.find_by_id(params[:post_id]) if params[:post_id]
    end
end
