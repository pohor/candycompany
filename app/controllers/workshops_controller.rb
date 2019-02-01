class WorkshopsController < ApplicationController
  before_action :find_workshop, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_latest

  def index
    @workshops = Workshop.all.order("date_start DESC").paginate(page: params[:page], per_page: 2)
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
      if @workshop.save
        flash[:notice] = "Udało Ci się dodać warsztat."
        redirect_to workshop_path(@workshop)
      else
        render 'new'
      end
  end

  def update
      if @workshop.update(workshop_params) || current_user.admin?
        flash[:notice] = "Warsztat zaktualizowany."
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


    def find_workshop
      @workshop = Workshop.find(params[:id])
    end

    def workshop_params
      params.require(:workshop).permit(:name, :date_start, :workshop_cover, :date_end, :time_start, :end_time, :place, :description)
    end

    def find_latest
      @latest_workshop = Workshop.all.order("date_start DESC").limit(1)[0]
    end


end
