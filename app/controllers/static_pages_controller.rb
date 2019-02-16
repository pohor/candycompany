class StaticPagesController < ApplicationController
  before_action :find_content, only: [:home, :admin]
  before_action :authenticate_admin, only: [:admin]

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
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 8)
    @categories = Category.all
    @ingredients = Ingredient.all
    @users = User.all
    @workshops = Workshop.all
  end

  def authenticate_admin
    if !user_signed_in? && !current_user&.admin?
      flash[:alert] = 'Nie możesz tego wyświetlić'
      return false
    end
    true    
  end

end
