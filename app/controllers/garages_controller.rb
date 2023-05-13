class GaragesController <ApplicationController
  def index
    @garages = Garage.order_by_created
  end

  def show
    @garage = Garage.find(params[:id])
  end
end