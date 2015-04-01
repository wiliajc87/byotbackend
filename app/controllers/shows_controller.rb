class ShowsController < ApplicationController
  before_action :authenticate_user!
  def index
    @q = Show.ransack(params[:q])
    @shows = @q.result.includes(:participants)
  end

  def show
    @show = Show.find(params[:id])
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      redirect_to @show
    else
      render :new
    end
  end



  private
  def show_params
    params.require(:show).permit(:title, :month, :year)
  end
end