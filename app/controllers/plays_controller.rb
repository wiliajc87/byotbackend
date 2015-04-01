class PlaysController < ApplicationController
  before_action :authenticate_user!
  def index
    @q = Play.ransack(params[:q])
    @plays = @q.result(distinct: true)
  end
  def show
    @play = Play.find(params[:id])
    @directors = []
    @writers = []
    @actors = []
    @others = []
    @play.performances.where(:role => "Director").each do |director|
        @directors << director.participant
      end
    @play.performances.where(:role => "Writer").each do |writer|
        @writers << writer.participant
      end
    @play.performances.where(:role => "Actor").each do |actor|
      @actors << actor.participant
    end
    @play.performances.where.not(:role => ["Actor","Writer","Director"]).each do |other|
      @others << other
    end
  end
end