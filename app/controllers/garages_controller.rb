class GaragesController <ApplicationController
  def index
    @garages = Garage.order_by_created
  end

  def show
    @garage = Garage.find(params[:id])
  end

  def new

  end

  def create
    garage = Garage.create!(garage_params)
    redirect_to "/garages"
  end

  private

  def garage_params
    params.permit(:name, :city, :open_to_public, :max_capacity)
  end
end