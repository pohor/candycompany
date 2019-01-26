class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_post, only: [:destroy, :edit, :update]

  def index
    @all_posts = Post.all
    @q = Post.ransack(params[:q])
    @posts = @q.result
    @categories = Category.all
  end

  def show
    @heart = Heart.find_or_initialize_by(post: @post, user: current_user)
  end

  def new
    @post = Post.new
  end

  def all
  end

  def edit
  end


  def create
    @post = Post.new(post_params)
    @post.user = current_user if current_user
      if @post.save
        flash[:notice] = "You have successfuly added a new post."
        redirect_to post_path(@post)
      else
        render 'new'
      end
  end

  def update
      if @post.update(post_params) || current_user.admin?
        flash[:notice] = "Post was successfuly updated."
        redirect_to post_path(@post)
      else
        render 'edit'
      end
  end


  def destroy
    @post.destroy
      redirect_to posts_path
  end

  private
    def authorize_post
      if @post.user != current_user && !current_user&.admin?
        flash[:alert] = "You are not allowed to do this."
        redirect_to posts_path
        return false
      end
    true
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :time, :skills, :post_cover, ingredient_ids: [], category_ids: [])
    end

end
