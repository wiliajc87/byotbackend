class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  def index
    @participants = Participant.all
  end
  def show
    @participant = Participant.find(params[:id])
  end
end