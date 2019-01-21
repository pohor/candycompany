class HeartsController < ApplicationController

  def create
    heart = Heart.new(post_id: params[:post_id], user: current_user)
    heart.save

    redirect_to post_path(heart.post)
  end


  def destroy
    heart = Heart.find(params[:id])
    heart.destroy

    redirect_to post_path(heart.post)
  end

end
