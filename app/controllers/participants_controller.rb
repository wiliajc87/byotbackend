class ParticipantsController < ApplicationController
  before_action :authenticate_user!
  def index
    @q = Participant.ransack(params[:q])
    @q.sorts = 'name asc' if @q.sorts.empty?
    @participants = @q.result(distinct: true)
  end

  def show
    @participant = Participant.find(params[:id])
    @contact_status
    if @participant.contact == true
      @contact_status = "Yes"
    else
      @contact_status = "No"
    end
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    @participant.phone.gsub!(/\D/, "")
    if @participant.save
      redirect_to @participant
    else
      render :new
    end
  end

  def members
    @members = []
    Participant.all.each do |part|
      if part.member? == true
        @members << part
      end
      @members
    end
  end

  def participant_params
    params.require(:participant).permit!
  end
end