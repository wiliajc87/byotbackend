class PerformancesController < ApplicationController
  before_action :authenticate_user!
  def new
    @show = Show.find(params[:show_id])
    @play = Play.find(params[:play_id])
    @performance = @play.performances.new
  end

  def create
    @show = Show.find(params[:show_id])
    @play = Play.find(params[:play_id])
    @participants = Participant.all
    @performance = @play.performances.new(show_play_performance_params)
    @performance.show_id = @show.id
    if @performance.role == "actor"
      @performance.role = "Actor"
      @performance.save
    elsif @performance.role == "director"
      @performance.role = "Director"
      @performance.save
    elsif @performance.role == "writer"
      @performance.role = "Writer"
      @performance.save
    else
      @performance.role.capitalize!
      @performance.save
    end
    redirect_to "/shows/#{@show.id}/plays/#{@play.id}"
  end

  def destroy
    @show = Show.find(params[:show_id])
    @play = Play.find(params[:play_id])
    @performance = Performance.find(params[:id])
    @performance.delete
    redirect_to "/shows/#{@show.id}/plays/#{@play.id}"
  end

  def show_play_performance_params
    params.require(:performance).permit!
  end
end