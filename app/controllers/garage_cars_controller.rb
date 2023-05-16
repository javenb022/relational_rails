class GarageCarsController < ApplicationController
  def index
    @garage = Garage.find(params[:garage_id])
    @cars = @garage.cars.all
  end

  def new
    @garage = Garage.find(params[:garage_id])
  end

  def create
    @garage = Garage.find(params[:garage_id])
    car = @garage.cars.create!(car_params)
    redirect_to "/garages/#{@garage.id}/cars"
  end

  private

  def car_params
    params.permit(:make, :model, :electric, :year)
  end
end