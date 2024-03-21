class F1TeamsController < ApplicationController
  def index
    @f1_teams = F1Team.recent_team
  end

  def show
    @f1_team = F1Team.find(params[:id])
  end
end