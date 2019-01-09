class StaticPagesController < ApplicationController
  def home
    @posts = Post.all
  end

  def warsztaty
  end

  def omnie
  end

  def kontakt
  end

  def wspolpraca
  end
end
