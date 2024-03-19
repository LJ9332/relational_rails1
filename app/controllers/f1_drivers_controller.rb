class F1DriversController < ApplicationController
  def index
    @f1_drivers = F1Driver.all
  end

  def show; end
end