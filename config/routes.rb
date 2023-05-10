Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/garages", to: "garages#index"
  get "/garages/:id", to: "garages#show"
end
