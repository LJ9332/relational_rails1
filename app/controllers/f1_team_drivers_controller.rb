class F1TeamDriversController < ApplicationController
  def index
    @f1_team = F1Team.find(params[:f1_team_id])
    @f1_drivers = @f1_team.f1_drivers
  end

  def new
    @f1_team = F1Team.find(params[:f1_team_id])
  end
  
  def create
    @f1_team = F1Team.find(params[:f1_team_id])
    @f1_team.f1_drivers.create!({
      name: params[:name],
      weight: params[:weight],
      world_champion: params[:world_champion]
    })
    
    redirect_to "/f1_teams/#{@f1_team.id}/f1_drivers"
  end
end