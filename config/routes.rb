Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/garages", to: "garages#index"
  post "/garages", to: "garages#create"
  get "/garages/new", to: "garages#new"
  get "/garages/:id/edit", to: "garages#edit"
  patch "/garages/:id", to: "garages#update"
  get "/garages/:garage_id/cars/new", to: "garage_cars#new"
  post "/garages/:garage_id/cars", to: "garage_cars#create"
  get "/garages/:id", to: "garages#show"
  get "/garages/:garage_id/cars", to: "garage_cars#index"

  get "/cars", to: "cars#index"
  get "/cars/:car_id", to: "cars#show"
end
