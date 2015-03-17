class PlaysController < ApplicationController
  def index
  end
  def show
    @play = Play.find(params[:id])
  end
end