class SearchesController < ApplicationController

  def new
    @search = Search.new
    @categories = Category.all
    @ingredients = Ingredient.all
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:time, :skills, ingredient_ids: [], category_ids: [])
  end

end
