class F1TeamsController < ApplicationController
  def index
    @f1_teams = F1Team.all
  end
end