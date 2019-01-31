class IngredientsController < ApplicationController
  before_action :find_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all.order("name DESC").paginate(page: params[:page], per_page: 20)
  end

  def show
    @posts = @ingredient.posts.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def new
    @ingredient = Ingredient.new
  end


  def edit
  end


  def create
    @ingredient = Ingredient.new(ingredient_params)
      if @ingredient.save
        redirect_to ingredient_path(@ingredient)
      else
        render 'new'
      end
  end

  def update
      if @ingredient.update(ingredient_params)
        redirect_to ingredient_path(@ingredient)
      else
        render 'edit'
      end
  end


  def destroy
    @ingredient.destroy
      redirect_to ingredients_path
  end

  private


    def find_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

end
