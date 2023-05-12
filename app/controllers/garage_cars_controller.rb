class GarageCarsController < ApplicationController
  def index
    @garage = Garage.find(params[:garage_id])
    @cars = @garage.cars.all
  end
end