class F1TeamDriversController < ApplicationController
  def index
    @f1_team = F1Team.find(params[:f1_team_id])
    @f1_drivers = @f1_team.f1_drivers
  end
end