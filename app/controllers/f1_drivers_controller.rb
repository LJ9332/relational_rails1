class F1DriversController < ApplicationController
  def index
    @f1_drivers = F1Driver.world_champion
  end

  def show
    @f1_driver = F1Driver.find(params[:id])
  end

  def edit
    @f1_driver = F1Driver.find(params[:id])
  end
  
  def update
    f1_driver = F1Driver.find(params[:id])
    f1_driver.update({
      name: params[:name],
      weight: params[:weight],
      world_champion: params[:world_champion]
    })
    
    f1_driver.save
    
    redirect_to "/f1_drivers/#{f1_driver.id}"
  end
end