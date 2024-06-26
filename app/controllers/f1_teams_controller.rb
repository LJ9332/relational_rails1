class F1TeamsController < ApplicationController
  def index
    @f1_teams = F1Team.recent_team
  end

  def show
    @f1_team = F1Team.find(params[:id])
  end
  
  def new; end
  
  def create
    f1_team = F1Team.new({
      name: params[:f1_team][:name],
      horsepower: params[:f1_team][:horsepower],
      slick_tires: params[:f1_team][:slick_tires]
    })
    
    f1_team.save
    
    redirect_to "/f1_teams"
  end
  
  def edit
    @f1_team = F1Team.find(params[:id])
  end
  
  def update
    f1_team = F1Team.find(params[:id])
    f1_team.update({
      name: params[:name],
      horsepower: params[:horsepower],
      slick_tires: params[:slick_tires]
    })
    
    f1_team.save
    
    redirect_to "/f1_teams/#{f1_team.id}"
  end
end