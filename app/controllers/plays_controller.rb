class PlaysController < ShowsController
  before_action :authenticate_user!
  def index
    @q = Play.ransack(params[:q])
    @plays = @q.result(distinct: true)
  end

  def new
    @show = Show.find(params[:show_id])
    @play = Play.new
  end

  def create
    @show = Show.find(params[:show_id])
    @play = @show.plays.create(show_play_params)
    redirect_to "/shows/#{@show.id}/plays/#{@play.id}"
  end

  def show
    @show = Show.find(params[:show_id])
    @play = Play.find(params[:id])
    @participants = @play.participants
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
  def show_play_params
    params.require(:play).permit!
  end
end