class UsersController < ApplicationController

  def index
    @users = User.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

end
