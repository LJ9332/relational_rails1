class F1DriversController < ApplicationController
  def index
    @f1_drivers = F1Driver.all
  end

  def show
    @f1_driver = F1Driver.find(params[:id])
  end
end