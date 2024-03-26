class F1TeamsController < ApplicationController
  def index
    @f1_teams = F1Team.recent_team
  end

  def show
    @f1_team = F1Team.find(params[:id])
    @f1_driver_count = @f1_team.f1_drivers.count
    #move to model
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
end