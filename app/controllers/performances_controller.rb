class PerformancesController < ApplicationController
  before_action :authenticate_user!
  def index
    @performances = Performance.all
  end
end