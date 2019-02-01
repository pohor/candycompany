class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :ransack, :search_result]
  before_action :authorize_post, only: [:destroy, :edit, :update]
  before_action :set_search

  def index
    @posts = Post.all
    @categories = Category.all
  end

  def ransack
    search_result
    render :search_result
  end

  def search_result
    @q = Post.joins(:categories).joins(:ingredients).ransack(params[:q])
    @posts = @q.result(distinct: true).order("created_at DESC").paginate(page: params[:page], per_page: 3)
  end

  def show
    @comment = Comment.new
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
        flash[:notice] = "Udało Ci się dodać nowy post."
        redirect_to post_path(@post)
      else
        render 'new'
      end
  end

  def update
      if @post.update(post_params) || current_user.admin?
        flash[:notice] = "Post zaktualizowany."
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
        flash[:alert] = "Ta akcja nie jest dla Ciebie dozwolona."
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
