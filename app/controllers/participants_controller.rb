class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  def index
    @q = Participant.ransack(params[:q])
    @participants = @q.result(distinct: true)
  end

  def show
    @participant = Participant.find(params[:id])
  end
end