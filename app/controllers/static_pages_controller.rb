class StaticPagesController < ApplicationController
  before_action :find_content

  def home
    @all_posts = Post.all
  end


  def omnie
  end

  def kontakt
  end

  def wspolpraca
  end

  def admin
  end

  private

  def find_content
    @posts = Post.all
    @categories = Category.all
    @ingredients = Ingredient.all
    @users = User.all
    @workshops = Workshop.all
  end


end
