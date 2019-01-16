class FavoritesController < ApplicationController

  def update
    favorite = Favorite.where(post: Post.find(params[:post]), user: current_user)
    if favorite == []
      Favorite.create(post: Post.find(params[:post]), user: current_user)
      @favorite_exists = true
      @post = Post.find(Favorite.last.post_id)
      @post.favorites_count += 1
      @post.save
    else
      favorite.destroy_all
      @favorite_exists = false
      @post = Post.find(Favorite.last.post_id)
      @post.favorites_count -= 1
      @post.save
    end

      respond_to do |format|
        format.html {}
        format.js {}
      end

  end

end
