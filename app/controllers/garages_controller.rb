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

  def edit
    @garage = Garage.find(params[:id])
  end

  def update
    garage = Garage.find(params[:id])
    garage.update(garage_params)
    redirect_to "/garages/#{garage.id}"
  end

  private

  def garage_params
    params.permit(:name, :city, :open_to_public, :max_capacity)
  end
end