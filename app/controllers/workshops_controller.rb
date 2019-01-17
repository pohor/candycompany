class WorkshopsController < ApplicationController
  before_action :find_workshop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  # before_action :authorize_workshop, only: [:destroy, :edit, :update]

  def index
    @workshops = Workshop.all
  end

  def show
  end

  def new
    @workshop = Workshop.new
  end


  def edit
  end


  def create
    @workshop = Workshop.new(workshop_params)
    # @workshop.user = current_user if current_user
      if @workshop.save
        flash[:notice] = "You have successfuly added a new post."
        redirect_to workshop_path(@workshop)
      else
        render 'new'
      end
  end

  def update
      if @workshop.update(workshop_params) || current_user.admin?
        flash[:notice] = "Post was successfuly updated."
        redirect_to workshop_path(@workshop)
      else
        render 'edit'
      end
  end


  def destroy
    @workshop.destroy
      redirect_to workshops_path
  end

  private
    # def authorize_workshop
    #   if @workshop.user != current_user && !current_user&.admin?
    #     flash[:alert] = "You are not allowed to do this."
    #     redirect_to workshops_path
    #     return false
    #   end
    # true
    # end

    def find_workshop
      @workshop = Workshop.find(params[:id])
    end

    def workshop_params
      params.require(:workshop).permit(:name, :date_start, :date_end, :time_start, :end_time, :place, :description)
    end
end
