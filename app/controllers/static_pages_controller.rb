class StaticPagesController < ApplicationController
  before_action :find_content

  def home
  end


  def omnie
  end

  def kontakt
  end


  def admin
  end

  private

  def find_content
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 9)
    @categories = Category.all
    @ingredients = Ingredient.all
    @users = User.all
    @workshops = Workshop.all
  end


end
