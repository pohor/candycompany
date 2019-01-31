class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.order("name DESC").paginate(page: params[:page], per_page: 15)
  end

  def show
    @posts = @category.posts.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end


  def edit
  end


  def create
    @category = Category.new(category_params)
      if @category.save
        redirect_to category_path(@category)
      else
        render 'new'
      end
  end

  def update
      if @category.update(category_params)
        redirect_to category_path(@category)
      else
        render 'edit'
      end
  end


  def destroy
    @category.destroy
      redirect_to categories_path
  end

  private


    def find_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :category_cover)
    end

end
