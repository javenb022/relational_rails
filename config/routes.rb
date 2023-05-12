Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/garages", to: "garages#index"
  get "/cars", to: "cars#index"
  
  get "/garages/:id", to: "garages#show"
  get "/cars/:car_id", to: "cars#show"
  get "/garages/:garage_id/cars", to: "garage_cars#index"
end
